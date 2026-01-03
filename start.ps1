# --- PROVERA ADMINISTRATORA ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "MOLIM TE, DESNI KLIK -> RUN AS ADMINISTRATOR!" -ForegroundColor Red
    Start-Sleep -Seconds 5
    exit
}

# --- ROBOTSKI UVOD I LOGIN ---
$sifra = "030714"
while ($true) {
    Clear-Host
    Write-Host @"
############################################################
#                                                          #
#    ____   _____ _   _     _ _____ _   _   _____ _____    #
#   / __ \ / ____| \ | |   | | ____| \ | | |_   _| ____|   #
#  | |  | | |  __|  \| |   | | |__ |  \| |   | | | |__     #
#  | |  | | | |_ | . ` |_  | |  __|| . ` |   | | |  __|    #
#  | |__| | |__| | |\  | |__| | |___| |\  |   | | | |___    #
#   \____/ \_____|_| \_|\____/|_____|_| \_|   |_| |_____|   #
#                                                          #
#                SYSTEM SERVICE TERMINAL v2.0              #
############################################################
"@ -ForegroundColor Cyan

    Write-Host "`n[ SISTEM ZAKLJUČAN ]" -ForegroundColor Red
    $unos = Read-Host " UNESI TAJNI KOD ZA PRISTUP"
   
    if ($unos -eq $sifra) {
        Write-Host "`nPRISTUP ODOBREN. POKREĆEM..." -ForegroundColor Green
        Start-Sleep -Seconds 1
        break
    } else {
        Write-Host "`nNEOVLAŠĆEN PRISTUP! POKUŠAJ PONOVO." -ForegroundColor Red
        Start-Sleep -Seconds 2
    }
}

# --- FUNKCIJA ZA ZAGLAVLJE ---
function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "         MAJSTOR OGNJEN | PROFESIONALNI ALAT        " -ForegroundColor White -BackgroundColor Blue
    Write-Host "====================================================" -ForegroundColor Cyan
}

# --- GLAVNI RADNI CIKLUS ---
do {
    Show-Header
    Write-Host " 1. AKTIVACIJA WINDOWSA (PITA TE Y/N)"
    Write-Host " 2. AKTIVACIJA OFFICE-A (PITA TE Y/N)"
    Write-Host " 3. POPRAVKA SISTEMA (SFC & DISM)"
    Write-Host " 4. INSTALACIJA PROGRAMA (BIRAŠ JEDAN PO JEDAN)"
    Write-Host " 5. OPTIMIZACIJA (TABELA KOMANDI)"
    Write-Host " 6. PROVERA LICENCE I BATERIJE"
    Write-Host " 7. ČIŠĆENJE (TEMP & KANTA)"
    Write-Host " 8. IZLAZ"
    Write-Host "----------------------------------------------------"
   
    $izbor = Read-Host "Izaberi opciju"

    switch ($izbor) {
        "1" {
            Show-Header
            $odluka = Read-Host "Da li želiš da aktiviraš Windows? (y/n)"
            if ($odluka -eq "y") { irm https://get.activated.win | iex }
        }
        "2" {
            Show-Header
            $odluka = Read-Host "Da li želiš da aktiviraš Office? (y/n)"
            if ($odluka -eq "y") { irm https://get.activated.win | iex }
        }
        "3" {
            Show-Header
            Write-Host "Popravljam sistemske fajlove..." -ForegroundColor Yellow
            sfc /scannow
            dism /online /cleanup-image /restorehealth
            Pause
        }
        "4" {
            Show-Header
            $programi = @(
                @{id="Google.Chrome"; n="Google Chrome"},
                @{id="RARLab.WinRAR"; n="WinRAR"},
                @{id="VideoLAN.VLC"; n="VLC Player"},
                @{id="AnyDeskSoftwareGmbH.AnyDesk"; n="AnyDesk"},
                @{id="Zoom.Zoom"; n="Zoom"}
            )
            foreach ($p in $programi) {
                $odg = Read-Host "Instalirati $($p.n)? (y/n)"
                if ($odg -eq "y") {
                    Write-Host "Instaliram $($p.n)..." -ForegroundColor Green
                    winget install --id $($p.id) --silent --accept-package-agreements --accept-source-agreements
                }
            }
            Pause
        }
        "5" {
            Show-Header
            Write-Host "Izvršavam tabelu optimizacije..." -ForegroundColor Cyan
            # Update Cache
            net stop wuauserv; net stop bits
            Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
            net start wuauserv; net start bits
            # Windows.old
            if (Test-Path "C:\Windows.old") { RD /S /Q "C:\Windows.old" }
            # Compact OS
            compact.exe /CompactOS:always
            Write-Host "Optimizacija završena!" -ForegroundColor Green
            Pause
        }
        "6" {
            Show-Header
            Write-Host "--- STATUS LICENCE ---"
            cscript //nologo $env:systemroot\system32\slmgr.vbs /xpr
            Write-Host "`n--- FABRIČKI KLJUČ ---"
            (Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
            Write-Host "`n--- ZDRAVLJE BATERIJE ---"
            powercfg /batteryreport
            Write-Host "Izveštaj o bateriji je sačuvan u tvom folderu."
            Pause
        }
        "7" {
            Show-Header
            Write-Host "Čistim Temp i Kantu..." -ForegroundColor Yellow
            Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Pause
        }
        "8" { exit }
    }
} while ($true)

 

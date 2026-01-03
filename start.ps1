# --- PROVERA ADMINISTRATORA ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "DESNI KLIK -> RUN AS ADMINISTRATOR!" -ForegroundColor Red
    Start-Sleep -Seconds 5; exit
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
    $unos = Read-Host " UNESI TAJNI KOD"
    if ($unos -eq $sifra) { break }
}

function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "         MAJSTOR OGNJEN | PROFESIONALNI ALAT        " -ForegroundColor White -BackgroundColor Blue
    Write-Host "====================================================" -ForegroundColor Cyan
}

do {
    Show-Header
    Write-Host " 1. WINDOWS AKTIVACIJA (Izbor verzije)"
    Write-Host " 2. OFFICE AKTIVACIJA (Izbor verzije)"
    Write-Host " 3. POPRAVKA SISTEMA (SFC & DISM)"
    Write-Host " 4. INSTALACIJA PROGRAMA (Jedan po jedan)"
    Write-Host " 5. OPTIMIZACIJA (Tabela komandi)"
    Write-Host " 6. PROVERA LICENCE I HARDVERA"
    Write-Host " 7. ČIŠĆENJE SISTEMA"
    Write-Host " 8. IZLAZ"
   
    $izbor = Read-Host "`nIzaberi opciju"

    switch ($izbor) {
        "1" {
            Show-Header
            Write-Host "--- IZBOR WINDOWS AKTIVACIJE ---" -ForegroundColor Yellow
            Write-Host " 1. Windows 10/11 Pro"
            Write-Host " 2. Windows 10/11 Home"
            Write-Host " 3. Windows Server"
            Write-Host " 4. NAZAD"
            $wWin = Read-Host "Izaberi"
            if ($wWin -ne "4") { irm https://get.activated.win | iex }
        }
        "2" {
            Show-Header
            Write-Host "--- IZBOR OFFICE AKTIVACIJE ---" -ForegroundColor Yellow
            Write-Host " 1. Office 2021 / 365"
            Write-Host " 2. Office 2019"
            Write-Host " 3. Office 2016"
            Write-Host " 4. NAZAD"
            $wOff = Read-Host "Izaberi"
            if ($wOff -ne "4") { irm https://get.activated.win | iex }
        }
        "3" { Show-Header; sfc /scannow; dism /online /cleanup-image /restorehealth; Pause }
        "4" {
            Show-Header
            $progs = @(@{id="Google.Chrome"; n="Chrome"}, @{id="RARLab.WinRAR"; n="WinRAR"}, @{id="VideoLAN.VLC"; n="VLC"}, @{id="AnyDeskSoftwareGmbH.AnyDesk"; n="AnyDesk"})
            foreach ($p in $progs) {
                $q = Read-Host "Instaliraj $($p.n)? (y/n)"
                if ($q -eq "y") { winget install --id $($p.id) --silent --accept-package-agreements --accept-source-agreements }
            }
            Pause
        }
        "5" {
            Show-Header
            Write-Host "Radim optimizaciju..."
            net stop wuauserv; net stop bits
            Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
            net start wuauserv; net start bits
            DISM /Online /Cleanup-Image /RestoreHealth
            compact.exe /CompactOS:always
            if (Test-Path "C:\Windows.old") { RD /S /Q "C:\Windows.old" }
            Write-Host "Završeno!" -ForegroundColor Green; Pause
        }
        "6" {
            Show-Header
            slmgr.vbs /xpr
            (Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
            powercfg /batteryreport
            Pause
        }
        "7" {
            Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Write-Host "Očišćeno!" -ForegroundColor Green; Pause
        }
        "8" { exit }
    }
} while ($true)

 

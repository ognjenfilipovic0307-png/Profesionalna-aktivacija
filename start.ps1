# --- PROVERA ADMINISTRATORSKIH PRAVA ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "MOLIM TE, POKRENI KAO ADMINISTRATOR!" -ForegroundColor Red
    Start-Sleep -Seconds 5
    exit
}

# --- LOZINKA ZA PRISTUP (BEZ RAZMAKA) ---
$mojaSifra = "030714"
$pustajUnutra = $false

while (-not $pustajUnutra) {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Red
    Write-Host "      MAJSTOR OGNJEN - SERVISNI SISTEM              " -ForegroundColor White -BackgroundColor Red
    Write-Host "====================================================" -ForegroundColor Red
    $unos = Read-Host " Unesite lozinku za pristup"

    if ($unos -eq $mojaSifra) {
        $pustajUnutra = $true
    } else {
        Write-Host " POGREŠNA ŠIFRA!" -ForegroundColor Red
        Start-Sleep -Seconds 2
    }
}

# --- FUNKCIJA ZA ZAGLAVLJE ---
function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "        MAJSTOR OGNJEN - PROFESIONALNI ALAT         " -ForegroundColor White -BackgroundColor Blue
    Write-Host "====================================================" -ForegroundColor Cyan
}

# --- GLAVNI MENI ---
do {
    Show-Header
    Write-Host " 1. WINDOWS AKTIVACIJA"
    Write-Host " 2. OFFICE AKTIVACIJA"
    Write-Host " 3. POPRAVKA SISTEMA (SFC & DISM)"
    Write-Host " 4. INSTALACIJA PROGRAMA (BIRAŠ ŠTA ŽELIŠ)"
    Write-Host " 5. PROVERI STATUS LICENCI"
    Write-Host " 6. ČIŠĆENJE SISTEMA (Temp & Kanta)"
    Write-Host " 7. MOJA BAZA ZNANJA (Sajt)"
    Write-Host " 8. IZLAZ"
    Write-Host "----------------------------------------------------"
   
    $izbor = Read-Host "Izaberi opciju"

    switch ($izbor) {
        "1" { Show-Header; Write-Host "Aktiviram Windows..."; irm https://get.activated.win | iex; Pause }
        "2" { Show-Header; Write-Host "Aktiviram Office..."; irm https://get.activated.win | iex; Pause }
        "3" { Show-Header; Write-Host "Popravljam sistem..."; sfc /scannow; dism /online /cleanup-image /restorehealth; Pause }
        "4" {
            Show-Header
            Write-Host "--- IZBOR PROGRAMA (Y = DA / N = NE) ---" -ForegroundColor Magenta
            $programi = @(
                @{id="Google.Chrome"; ime="Google Chrome"},
                @{id="RARLab.WinRAR"; ime="WinRAR"},
                @{id="VideoLAN.VLC"; ime="VLC Player"},
                @{id="AnyDeskSoftwareGmbH.AnyDesk"; ime="AnyDesk"}
            )
            foreach ($p in $programi) {
                $odgovor = Read-Host "Instalirati $($p.ime)?"
                if ($odgovor -eq "y" -or $odgovor -eq "Y") {
                    Write-Host "Instaliram $($p.ime)..." -ForegroundColor Cyan
                    winget install --id $($p.id) --silent --accept-package-agreements --accept-source-agreements
                }
            }
            Pause
        }
        "5" { Show-Header; cscript //nologo $env:systemroot\system32\slmgr.vbs /xpr; Pause }
        "6" {
            Show-Header; Write-Host "Čistim sistem...";
            Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Pause
        }
        "7" { Start-Process "https://ognjenfilipovic0307-png.github.io/Profesionalna-aktivacija/"; Pause }
        "8" { exit }
    }
} while ($true)

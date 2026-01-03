# --- PROVERA ŠIFRE ---
$mojaSifra = "0307 14"
Clear-Host
Write-Host "====================================================" -ForegroundColor Red
Write-Host "          MAJSTOR TECH - ZAKLJUČAN SISTEM           " -ForegroundColor White -BackgroundColor Red
Write-Host "          Autor: OGNJEN FILIPOVIĆ                   " -ForegroundColor Yellow
Write-Host "====================================================" -ForegroundColor Red
Write-Host ""
$unos = Read-Host "Unesite lozinku za pristup"

if ($unos -ne $mojaSifra) {
    Write-Host "POGREŠNA ŠIFRA! Pristup odbijen." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}

# --- FUNKCIJA ZA ZAGLAVLJE ---
function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "          MAJSTOR TECH - AKTIVACIONI SISTEM         " -ForegroundColor White -BackgroundColor Blue
    Write-Host "          Skriptni autor: OGNJEN FILIPOVIĆ          " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Cyan
}

# --- GLAVNA PETLJA ---
do {
    Show-Header
    Write-Host " 1. Windows Aktivacija (Pro/Home/Ent)"
    Write-Host " 2. Office Aktivacija (2016-2021/365)"
    Write-Host " 3. KMS38 Aktivacija (do 2038 godine)"
    Write-Host " 4. Online KMS (Privremena 180 dana)"
    Write-Host " 5. Proveri Status Aktivacije"
    Write-Host " 6. Troubleshoot (Uradi Sam)"
    Write-Host " 7. Extras (Uradi Sam)"
    Write-Host " 8. EXIT / Izlaz"
    Write-Host "----------------------------------------------------"
   
    $glavniIzbor = Read-Host "Majstore Ognjene, izaberi opciju"

    switch ($glavniIzbor) {
        "1" {
            do {
                Show-Header
                Write-Host ">>> WINDOWS AKTIVACIJA" -ForegroundColor Magenta
                Write-Host " 1) Windows 10/11 Pro"
                Write-Host " 2) Windows 10/11 Home"
                Write-Host " 3) Windows 10/11 Enterprise"
                Write-Host " 0) VRATI SE U GLAVNI MENI" -ForegroundColor Red
                $winIzbor = Read-Host "Izbor"
                if ($winIzbor -eq "0") { break }
                if ($winIzbor -match "[1-3]") {
                    Write-Host "Aktivacija u toku... (Pokrećem proces)" -ForegroundColor Green
                    # Ovde kasnije ubaciš svoju komandu za aktivaciju
                    Pause
                }
            } while ($true)
        }
       
        "2" {
            do {
                Show-Header
                Write-Host ">>> OFFICE AKTIVACIJA" -ForegroundColor Magenta
                Write-Host " 1) Office 2016"
                Write-Host " 2) Office 2019"
                Write-Host " 3) Office 2021"
                Write-Host " 4) Office 365"
                Write-Host " 0) VRATI SE U GLAVNI MENI" -ForegroundColor Red
                $offIzbor = Read-Host "Izbor"
                if ($offIzbor -eq "0") { break }
                if ($offIzbor -match "[1-4]") {
                    Write-Host "Aktivacija Office-a u toku..." -ForegroundColor Green
                    # Ovde kasnije ubaciš komandu za Office
                    Pause
                }
            } while ($true)
        }

        "5" {
            Show-Header
            Write-Host "PROVERA STATUSA..." -ForegroundColor Yellow
            cscript //nologo $env:systemroot\system32\slmgr.vbs /xpr
            Pause
        }

        "8" { exit }
    }
} while ($true)

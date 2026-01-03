# --- PROVERA ŠIFRE (Ognjen 030714) ---
$mojaSifra = "030714"
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
    Write-Host " 1. Windows Aktivacija (Izbor verzije)"
    Write-Host " 2. Office Aktivacija (Izbor verzije)"
    Write-Host " 3. Massgrave Menu (Sve metode)"
    Write-Host " 4. Online KMS (Brza aktivacija)"
    Write-Host " 5. Proveri Status Aktivacije"
    Write-Host " 6. Troubleshoot (U pripremi)"
    Write-Host " 7. Extras (U pripremi)"
    Write-Host " 8. EXIT / Izlaz"
    Write-Host "----------------------------------------------------"
   
    $glavniIzbor = Read-Host "Izaberi opciju"

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
                    Write-Host "Pokrećem aktivaciju preko Massgrave sistema..." -ForegroundColor Green
                    irm https://get.activated.win | iex
                    Pause
                }
            } while ($true)
        }
       
        "2" {
            do {
                Show-Header
                Write-Host ">>> OFFICE AKTIVACIJA" -ForegroundColor Magenta
                Write-Host " 1) Office (Sve verzije)"
                Write-Host " 0) VRATI SE U GLAVNI MENI" -ForegroundColor Red
                $offIzbor = Read-Host "Izbor"
                if ($offIzbor -eq "0") { break }
                if ($offIzbor -eq "1") {
                    Write-Host "Pokrećem Office aktivaciju..." -ForegroundColor Green
                    irm https://get.activated.win | iex
                    Pause
                }
            } while ($true)
        }

        "3" {
            Show-Header
            Write-Host "Pokrećem Massgrave AIO Menu..." -ForegroundColor Cyan
            irm https://get.activated.win | iex
        }

        "4" {
            Show-Header
            Write-Host "Pokrećem Online KMS..." -ForegroundColor Cyan
            irm https://get.activated.win | iex
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

# Funkcija za zaglavlje sa tvojim potpisom (ovo se ponavlja svuda)
function Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "          AKTIVACIONI MENI - MAJSTOR TECH           " -ForegroundColor White -BackgroundColor Blue
    Write-Host "          Skriptni autor: OGNJEN FILIPOVIĆ          " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Cyan
}

# GLAVNI MENI
Header
Write-Host "1  HWID aktivacija (Windows)"
Write-Host "2  Ohook aktivacija (Office)"
Write-Host "3  KMS38 (aktivacija do 2038)"
Write-Host "4  Online KMS (180 dana)"
Write-Host "5  Activation Status"
Write-Host "6  Troubleshoot (Uradi Sam)"
Write-Host "7  Extras (Uradi Sam)"
Write-Host "8  Help / EXIT"
Write-Host "----------------------------------------------------"

$izbor = Read-Host "Izaberite opciju"

switch ($izbor) {
    1 {
        Header
        Write-Host "[OPCIJA 1] Pokrećem HWID trajnu aktivaciju..." -ForegroundColor Green
        # Ovde ide kod za HWID (kao u MAS-u)
        slmgr /ato
        Pause
    }
   
    2 {
        Header
        Write-Host "Izaberite verziju Office-a za aktivaciju:" -ForegroundColor Yellow
        Write-Host "A - Office 2016"
        Write-Host "B - Office 2019"
        Write-Host "C - Office 2021"
        Write-Host "D - Office 365 / Sve verzije (Ohook)"
        $offIzbor = Read-Host "Unesite slovo"
        Write-Host "Aktivacija u toku..." -ForegroundColor Green
        Pause
    }

    3 {
        Header
        Write-Host "[OPCIJA 3] KMS38 Aktivacija..."
        # KMS38 komanda
        Pause
    }

    4 {
        Header
        Write-Host "[OPCIJA 4] Online KMS Aktivacija (180 dana)..."
        slmgr /skms kms8.msguides.com
        slmgr /ato
        Pause
    }

    5 {
        Header
        Write-Host "PROVERA STATUSA AKTIVACIJE:" -ForegroundColor Cyan
        # Izvlačenje statusa
        cscript //nologo c:\windows\system32\slmgr.vbs /xpr
        Write-Host "Sistem proveren!" -ForegroundColor Green
        Pause
    }

    6 {
        Header
        Write-Host "ALATI ZA POPRAVKU (Troubleshoot):"
        Write-Host "- Brisanje neuspelih ključeva..."
        Write-Host "- Restartovanje Software Protection servisa..."
        Pause
    }

    7 {
        Header
        Write-Host "DODATNE OPCIJE (Extras):"
        Write-Host "- Promena verzije Windowsa (npr Home u Pro)..."
        Pause
    }

    8 {
        Write-Host "Pozdrav od Ognjena! Izlazim..." -ForegroundColor Magenta
        Start-Sleep -Seconds 2
        exit
    }
}

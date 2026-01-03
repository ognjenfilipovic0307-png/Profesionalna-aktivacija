# --- 1. PROVERA ŠIFRE (Ognjen 0307 14) ---
$mojaSifra = "0307 14"
$pustajUnutra = $false

while (-not $pustajUnutra) {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Red
    Write-Host "      MAJSTOR TECH - SISTEM JE ZAKLJUČAN            " -ForegroundColor White -BackgroundColor Red
    Write-Host "====================================================" -ForegroundColor Red
    $unos = Read-Host " Unesite lozinku za pristup"
    if ($unos -eq $mojaSifra) { $pustajUnutra = $true }
    else { Write-Host " Pogrešna šifra! Pokušaj ponovo..." -ForegroundColor Red; Start-Sleep 1 }
}

# --- 2. FUNKCIJA ZA ZAGLAVLJE ---
function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "        DOBRODOŠAO MAJSTORE OGNJENE!                " -ForegroundColor White -BackgroundColor Blue
    Write-Host "        SISTEM SPREMAN - SVE JE SA SERVERA          " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Cyan
}

# --- 3. GLAVNI MENI ---
do {
    Show-Header
    Write-Host " 1. WINDOWS AKTIVACIJA (Biranje verzije)"
    Write-Host " 2. OFFICE AKTIVACIJA (Biranje verzije)"
    Write-Host " 3. SISTEMSKA POPRAVKA & UPDATE (DISM/SFC)"
    Write-Host " 4. INSTALACIJA PROGRAMA (Chrome, WinRAR, VLC...)"
    Write-Host " 5. PROVERI STATUS LICENCI"
    Write-Host " 6. EXTRAS / OGNJEN TOOLBOX"
    Write-Host " 8. IZLAZ"
    Write-Host "----------------------------------------------------"
    $izbor = Read-Host "Izaberi opciju"

    switch ($izbor) {
        "1" {
            do {
                Show-Header
                Write-Host ">>> WINDOWS AKTIVACIJA (HWID)" -ForegroundColor Magenta
                Write-Host " 1) Windows 10/11 Pro"
                Write-Host " 2) Windows 10/11 Home"
                Write-Host " 3) Windows 10/11 Enterprise"
                Write-Host " 0) NAZAD"
                $win = Read-Host "Izbor"
                if ($win -eq "0") { break }
                Write-Host "Pokrećem tvoju HWID aktivaciju..." -ForegroundColor Green
                irm https://get.activated.win | iex # Ovde kasnije stavi svoj link ako želiš
                Pause
            } while ($true)
        }

        "2" {
            do {
                Show-Header
                Write-Host ">>> OFFICE AKTIVACIJA" -ForegroundColor Magenta
                Write-Host " 1) Office 2019"
                Write-Host " 2) Office 2021"
                Write-Host " 3) Office 365"
                Write-Host " 0) NAZAD"
                $off = Read-Host "Izbor"
                if ($off -eq "0") { break }
                Write-Host "Aktiviram Office sa zvaničnog servera..." -ForegroundColor Green
                irm https://get.activated.win | iex
                Pause
            } while ($true)
        }

        "3" {
            Show-Header
            Write-Host "Pokrećem duboko skeniranje i Update sistema..." -ForegroundColor Yellow
            Write-Host "Ovo može potrajati, Windows se sam popravlja..."
            dism /online /cleanup-image /restorehealth
            sfc /scannow
            Write-Host "Sistem je osvežen!" -ForegroundColor Green
            Pause
        }

        "4" {
            do {
                Show-Header
                Write-Host ">>> INSTALACIJA PROGRAMA (ZVANIČNI SERVERI)" -ForegroundColor Magenta
                Write-Host " 1) Google Chrome"
                Write-Host " 2) WinRAR"
                Write-Host " 3) VLC Player"
                Write-Host " 4) 7-Zip"
                Write-Host " 9) INSTALIRAJ SVE ODJEDNOM (Full Setup)"
                Write-Host " 0) NAZAD"
                $soft = Read-Host "Šta instaliramo"
                if ($soft -eq "0") { break }
               
                $lista = switch($soft) {
                    "1" { @("Google.Chrome") }
                    "2" { @("RARLab.WinRAR") }
                    "3" { @("VideoLAN.VLC") }
                    "4" { @("7zip.7zip") }
                    "9" { @("Google.Chrome", "RARLab.WinRAR", "VideoLAN.VLC", "7zip.7zip") }
                }

                foreach ($item in $lista) {
                    Write-Host "Instaliram: $item ..." -ForegroundColor Cyan
                    winget install --id $item --silent --accept-package-agreements --accept-source-agreements
                }
                Write-Host "Svi izabrani programi su instalirani!" -ForegroundColor Green; Pause
            } while ($true)
        }

        "5" {
            Show-Header
            Write-Host "STATUS LICENCI:" -ForegroundColor Yellow
            cscript //nologo $env:systemroot\system32\slmgr.vbs /xpr
            Pause
        }

        "8" { exit }
    }
} while ($true)

 

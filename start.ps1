# --- 1. PROVERA ŠIFRE ---
$mojaSifra = "0307 14"
$pustajUnutra = $false
while (-not $pustajUnutra) {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Red
    Write-Host "      MAJSTOR TECH - SISTEM JE ZAKLJUČAN            " -ForegroundColor White -BackgroundColor Red
    Write-Host "====================================================" -ForegroundColor Red
    $unos = Read-Host " Unesite lozinku"
    if ($unos -eq $mojaSifra) { $pustajUnutra = $true }
    else { Write-Host " Pogrešna šifra! Pokušaj ponovo..." -ForegroundColor Red; Start-Sleep 1 }
}

function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "        MAJSTOR OGNJEN - PROFESIONALNI ALAT         " -ForegroundColor White -BackgroundColor Blue
    Write-Host "====================================================" -ForegroundColor Cyan
}

do {
    Show-Header
    Write-Host " 1. WINDOWS AKTIVACIJA"
    Write-Host " 2. OFFICE AKTIVACIJA"
    Write-Host " 3. POPRAVKA SISTEMA & UPDATE"
    Write-Host " 4. INSTALACIJA PROGRAMA (Sve sa servera)"
    Write-Host " 5. PROVERI STATUS LICENCI"
    Write-Host " 6. EXTRAS (Servisni alati)"
    Write-Host " 8. IZLAZ"
    Write-Host "----------------------------------------------------"
    $izbor = Read-Host "Izaberi opciju"

    switch ($izbor) {
        "1" {
            do {
                Show-Header
                Write-Host ">>> WINDOWS AKTIVACIJA" -ForegroundColor Magenta
                Write-Host " 1) Windows 10/11 Pro"
                Write-Host " 2) Windows 10/11 Home"
                Write-Host " 3) Windows 10/11 Enterprise"
                Write-Host " 4) AUTOMATSKA AKTIVACIJA (Sve verzije)"
                Write-Host " 0) NAZAD"
                $win = Read-Host "Izbor"
                if ($win -eq "0") { break }
                Write-Host "Pokrećem aktivaciju..." -ForegroundColor Green
                irm https://get.activated.win | iex
                Pause
            } while ($true)
        }

        "2" {
            do {
                Show-Header
                Write-Host ">>> OFFICE AKTIVACIJA" -ForegroundColor Magenta
                Write-Host " 1) Office 2016 (Novo!)"
                Write-Host " 2) Office 2019"
                Write-Host " 3) Office 2021"
                Write-Host " 4) Office 365"
                Write-Host " 0) NAZAD"
                $off = Read-Host "Izbor"
                if ($off -eq "0") { break }
                Write-Host "Aktiviram Office..." -ForegroundColor Green
                irm https://get.activated.win | iex
                Pause
            } while ($true)
        }

        "4" {
            do {
                Show-Header
                Write-Host ">>> INSTALACIJA PROGRAMA" -ForegroundColor Magenta
                Write-Host " 1) Chrome | 2) WinRAR | 3) VLC | 4) 7-Zip"
                Write-Host " 9) INSTALIRAJ SVE OGNJEN PACK (Full Setup)"
                Write-Host " 0) NAZAD"
                $soft = Read-Host "Izbor"
                if ($soft -eq "0") { break }
                $lista = switch($soft) { "1" {@("Google.Chrome")}; "2" {@("RARLab.WinRAR")}; "3" {@("VideoLAN.VLC")}; "4" {@("7zip.7zip")}; "9" {@("Google.Chrome", "RARLab.WinRAR", "VideoLAN.VLC", "7zip.7zip")} }
                foreach ($item in $lista) { Write-Host "Instaliram: $item ..." -ForegroundColor Cyan; winget install --id $item --silent --accept-package-agreements --accept-source-agreements }
                Write-Host "Završeno!" -ForegroundColor Green; Pause
            } while ($true)
        }

        "6" {
            do {
                Show-Header
                Write-Host ">>> EXTRAS - OGNJENOV TOOLBOX" -ForegroundColor Magenta
                Write-Host " 1) Napravi 'SERVIS' folder na Desktopu"
                Write-Host " 2) Otvori moj GitHub (Baza znanja)"
                Write-Host " 0) NAZAD"
                $ex = Read-Host "Izbor"
                if ($ex -eq "0") { break }
                if ($ex -eq "1") {
                    New-Item -ItemType Directory -Path "$env:USERPROFILE\Desktop\SERVIS_OGNJEN" -Force
                    Write-Host "Folder napravljen!" -ForegroundColor Green; Pause
                }
                if ($ex -eq "2") { Start-Process "https://github.com/"; Pause }
            } while ($true)
        }

        "8" { exit }
    }
} while ($true)

 

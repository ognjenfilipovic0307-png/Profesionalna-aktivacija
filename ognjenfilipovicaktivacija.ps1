# --- TVOJA ŠIFRA ---
$mojaSifra = "0307 14"
$pustaj = $false
while (-not $pustaj) {
    Clear-Host
    Write-Host "======= ZAKLJUČAN SISTEM: OGNJEN FILIPOVIĆ =======" -ForegroundColor Red
    $u = Read-Host "Unesite lozinku"
    if ($u -eq $mojaSifra) { $pustaj = $true } else { Write-Host "Pogrešno!"; Start-Sleep 1 }
}

function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "          OGNJEN TECH - UNIVERZALNI ALAT            " -ForegroundColor White -BackgroundColor Blue
    Write-Host "          SVE VERZIJE DIREKTNO SA SERVERA           " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Cyan
}

do {
    Show-Header
    Write-Host " 1. Windows Aktivacija (Tvoj HWID Metod)"
    Write-Host " 2. Office Aktivacija (Sve verzije)"
    Write-Host " 3. Windows Update & Popravka"
    Write-Host " 4. Microsoft Store Popravka"
    Write-Host " 5. Proveri Status Licence"
    Write-Host " 6. INSTALACIJA PROGRAMA (Chrome, VLC, WinRAR...)"
    Write-Host " 7. EXTRAS / TVOJI ALATI"
    Write-Host " 8. EXIT"
    Write-Host "----------------------------------------------------"
   
    $izbor = Read-Host "Izaberi opciju"

    switch ($izbor) {
        "1" {
            # Ovde pozivamo TVOJU skriptu sa tvog GitHuba
            Write-Host "Pokrećem tvoj HWID sistem..." -ForegroundColor Green
            # irm https://raw.githubusercontent.com/TVOJ_USER/REPO/main/tvoj.ps1 | iex
            Pause
        }

        "6" {
            do {
                Show-Header
                Write-Host ">>> INSTALACIJA SA ZVANIČNIH SERVERA" -ForegroundColor Magenta
                Write-Host " 1) Google Chrome"
                Write-Host " 2) VLC Player"
                Write-Host " 3) WinRAR"
                Write-Host " 4) 7-Zip"
                Write-Host " 5) Steam"
                Write-Host " 0) NAZAD"
                $soft = Read-Host "Šta instaliramo"
                if ($soft -eq "0") { break }
               
                $ID = switch($soft) {
                    "1" { "Google.Chrome" }
                    "2" { "VideoLAN.VLC" }
                    "3" { "RARLab.WinRAR" }
                    "4" { "7zip.7zip" }
                    "5" { "Valve.Steam" }
                }
               
                Write-Host "Instaliram $ID direktno od autora..." -ForegroundColor Cyan
                winget install --id $ID --silent --accept-package-agreements --accept-source-agreements
                Write-Host "Završeno!" -ForegroundColor Green; Pause
            } while ($true)
        }

        "3" {
            Show-Header
            Write-Host "Pokrećem sistemsko čišćenje i Update..." -ForegroundColor Yellow
            dism /online /cleanup-image /restorehealth
            sfc /scannow
            Pause
        }

        "7" {
             Show-Header
             Write-Host ">>> OGNJENOV EXTRAS MENI" -ForegroundColor Magenta
             Write-Host "Ovde ubacuješ svoje linkove ili skripte."
             Pause
        }

        "8" { exit }
    }
} while ($true)

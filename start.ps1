# --- 1. PROVERA ŠIFRE (Neprobojno) ---
$mojaSifra = "0307 14"
$pustajUnutra = $false

while (-not $pustajUnutra) {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Red
    Write-Host "      MAJSTOR TECH - SISTEM JE ZAKLJUČAN            " -ForegroundColor White -BackgroundColor Red
    Write-Host "      AUTOR: OGNJEN FILIPOVIĆ                       " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Red
    Write-Host ""
    $unos = Read-Host " Unesite lozinku za pristup"

    if ($unos -eq $mojaSifra) {
        $pustajUnutra = $true
        Write-Host " Pristup odobren! Dobrodošao, Ognjene." -ForegroundColor Green
        Start-Sleep -Seconds 1
    }
    else {
        Write-Host " POGREŠNA ŠIFRA! Pokušaj ponovo..." -ForegroundColor Red
        Start-Sleep -Seconds 2
    }
}

# --- 2. FUNKCIJA ZA ZAGLAVLJE ---
function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "        MAJSTOR OGNJEN - UNIVERZALNI ALAT           " -ForegroundColor White -BackgroundColor Blue
    Write-Host "        SVE VERZIJE DIREKTNO SA SERVERA             " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Cyan
}

# --- 3. GLAVNA PETLJA ---
do {
    Show-Header
    Write-Host " 1. WINDOWS AKTIVACIJA (Sve verzije)"
    Write-Host " 2. OFFICE AKTIVACIJA (2016 - 365)"
    Write-Host " 3. POPRAVKA SISTEMA (SFC, DISM, Update)"
    Write-Host " 4. INSTALACIJA PROGRAMA (Velika lista)"
    Write-Host " 5. PROVERI STATUS LICENCI"
    Write-Host " 6. SERVISNI TOOLS (Temp Clean & Kanta)"
    Write-Host " 7. OGNJEN EXTRAS (GitHub & Web Linkovi)"
    Write-Host " 8. IZLAZ"
    Write-Host "----------------------------------------------------"
   
    $izbor = Read-Host "Izaberi opciju"

    switch ($izbor) {
        "1" {
            Show-Header
            Write-Host "Pokrećem Windows Aktivaciju..." -ForegroundColor Green
            irm https://get.activated.win | iex
            Pause
        }

        "2" {
            Show-Header
            Write-Host "Pokrećem Office Aktivaciju..." -ForegroundColor Green
            irm https://get.activated.win | iex
            Pause
        }

        "3" {
            Show-Header
            Write-Host "Pokrećem sistemsku popravku..." -ForegroundColor Yellow
            sfc /scannow
            dism /online /cleanup-image /restorehealth
            Write-Host "Sistem je osvežen!" -ForegroundColor Green
            Pause
        }

        "4" {
            do {
                Show-Header
                Write-Host ">>> IZABERI PROGRAM ZA INSTALACIJU:" -ForegroundColor Magenta
                Write-Host " 1) Chrome        2) Firefox      3) WinRAR"
                Write-Host " 4) 7-Zip         5) VLC Player   6) AnyDesk"
                Write-Host " 7) TeamViewer    8) Spotify      9) Adobe Reader"
                Write-Host " 10) Discord      11) Steam       12) Zoom"
                Write-Host " 99) INSTALIRAJ SVE OSNOVNO (Chrome, WinRAR, VLC, PDF)"
                Write-Host " 0) VRATI SE NAZAD" -ForegroundColor Red
               
                $soft = Read-Host "Unesi broj"
                if ($soft -eq "0") { break }
               
                $id = switch($soft) {
                    "1" { @("Google.Chrome") }
                    "2" { @("Mozilla.Firefox") }
                    "3" { @("RARLab.WinRAR") }
                    "4" { @("7zip.7zip") }
                    "5" { @("VideoLAN.VLC") }
                    "6" { @("AnyDeskSoftwareGmbH.AnyDesk") }
                    "7" { @("TeamViewer.TeamViewer") }
                    "8" { @("Spotify.Spotify") }
                    "9" { @("Adobe.Acrobat.Reader.64-bit") }
                    "10" { @("Discord.Discord") }
                    "11" { @("Valve.Steam") }
                    "12" { @("Zoom.Zoom") }
                    "99" { @("Google.Chrome", "RARLab.WinRAR", "VideoLAN.VLC", "Adobe.Acrobat.Reader.64-bit") }
                    Default { $null }
                }

                if ($id) {
                    foreach ($app in $id) {
                        Write-Host "Instaliram: $app ..." -ForegroundColor Cyan
                        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
                    }
                    Write-Host "Instalacija završena!" -ForegroundColor Green; Pause
                }
            } while ($true)
        }

        "5" {
            Show-Header
            Write-Host "Provera licence..." -ForegroundColor Yellow
            cscript //nologo $env:systemroot\system32\slmgr.vbs /xpr
            Pause
        }

        "6" {
            Show-Header
            Write-Host "1. Čišćenje Temp fajlova..." -ForegroundColor Yellow
            Remove-Item -Path $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "2. Pražnjenje kante za smeće..." -ForegroundColor Yellow
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Write-Host "3. Pravljenje SERVIS foldera na Desktopu..." -ForegroundColor Cyan
            $putanja = Join-Path ([Environment]::GetFolderPath("Desktop")) "SERVIS_OGNJEN"
            if (-not (Test-Path $putanja)) { New-Item -ItemType Directory -Path $putanja -Force }
            Write-Host "Sve je završeno uspešno!" -ForegroundColor Green
            Pause
        }

        "7" {
            do {
                Show-Header
                Write-Host ">>> OGNJEN WEB PREČICE:" -ForegroundColor Magenta
                Write-Host " 1) Otvori GitHub"
                Write-Host " 2) Otvori Google"
                Write-Host " 3) Otvori YouTube"
                Write-Host " 0) NAZAD"
                $web = Read-Host "Izbor"
                if ($web -eq "0") { break }
                if ($web -eq "1") { Start-Process "https://github.com" }
                if ($web -eq "2") { Start-Process "https://google.com" }
                if ($web -eq "3") { Start-Process "https://youtube.com" }
            } while ($true)
        }

        "8" { exit }
    }
} while ($true)

 

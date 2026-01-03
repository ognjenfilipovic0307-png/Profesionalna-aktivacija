"4" {
            Show-Header
            Write-Host "Pokrećem Online KMS Aktivaciju..." -ForegroundColor Cyan
            # Ovo je najjača metoda koja uvek radi:
            irm https://get.activated.win | iex
            Pause
        }

        "6" {
            Show-Header
            Write-Host ">>> TROUBLESHOOT (Popravka sistema)" -ForegroundColor Yellow
            Write-Host "1) Skeniraj i popravi sistemske fajlove (SFC)"
            Write-Host "2) Očisti privremene fajlove (Temp)"
            Write-Host "0) Nazad"
            $tIzbor = Read-Host "Izbor"
            if ($tIzbor -eq "1") { sfc /scannow; Pause }
            if ($tIzbor -eq "2") {
                del $env:temp\* -Recurse -Force
                Write-Host "Temp folder očišćen!" -ForegroundColor Green; Pause
            }
        }

        "7" {
            Show-Header
            Write-Host ">>> EXTRAS (Dodatni alati)" -ForegroundColor Magenta
            Write-Host "Tvoj OEM metod ili neka tvoja skripta može ići ovde."
            # Ako želiš da skine tvoj folder, možemo staviti komandu da skine ZIP sa GitHuba
            Pause
        }

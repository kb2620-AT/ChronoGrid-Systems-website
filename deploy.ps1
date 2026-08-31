param(
    [string]$Nachricht = ""
)

$RepoPath = $PSScriptRoot
Set-Location $RepoPath

if ($Nachricht -eq "") {
    $Datum = Get-Date -Format "yyyy-MM-dd HH:mm"
    $Nachricht = "update: $Datum"
}

Write-Host ""
Write-Host "  ChronoGrid Deploy" -ForegroundColor Cyan
Write-Host "  Commit: $Nachricht" -ForegroundColor DarkGray
Write-Host ""

# Alle Aenderungen stagen
git add -A

# Pruefen ob etwas zu committen ist
$Status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($Status)) {
    Write-Host "  Keine Aenderungen vorhanden." -ForegroundColor Yellow
    Write-Host ""
    pause
    exit 0
}

Write-Host "  [1/3] Commit..." -ForegroundColor White
git commit -m $Nachricht
if ($LASTEXITCODE -ne 0) { Write-Host "  FEHLER beim Commit." -ForegroundColor Red; pause; exit 1 }

Write-Host "  [2/3] Pull (rebase)..." -ForegroundColor White
git pull --rebase
if ($LASTEXITCODE -ne 0) { Write-Host "  FEHLER beim Pull." -ForegroundColor Red; pause; exit 1 }

Write-Host "  [3/3] Push..." -ForegroundColor White
git push
if ($LASTEXITCODE -ne 0) { Write-Host "  FEHLER beim Push." -ForegroundColor Red; pause; exit 1 }

Write-Host ""
Write-Host "  Fertig! Live in ~1 Minute:" -ForegroundColor Green
Write-Host "  https://kb2620-at.github.io/ChronoGrid-Systems-website/" -ForegroundColor Cyan
Write-Host ""
pause

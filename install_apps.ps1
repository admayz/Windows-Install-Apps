# ##################################################################
#                  Windows Winget App Install Script               #
# ##################################################################

# --- EDIT THIS LIST ---
# To find the ID of an app, run: winget search "AppName"
$packages = @(
    # --- System & Utilities ---
    "AdrienAllard.FileConverter",
    "GNU.Wget2"
    "Git.Git",
    "M2Team.NanaZip",
    "ShareX.ShareX",

    # --- Various Programs ---
    "Ditto.Ditto",
    "Docker.DockerDesktop",
    "SteelSeries.GG",
    "Cloudflare.Warp",
    "RamenSoftware.Windhawk",
    "Microsoft.PowerToys",
    "Bitwarden.Bitwarden",
    "DBeaver.DBeaver.Community",
    "Postman.Postman",
    "Stremio.StremioService",
    "Microsoft.VisualStudioCode",
    "Microsoft.VisualStudio.2022.Community",
    "Mozilla.Thunderbird",
    "JDownloader.JDownloader",
    "ExifCleaner.ExifCleaner",
    "Obsidian.Obsidian",
    "xanderfrangos.twinkletray",
    "File-New-Project.EarTrumpet",
    "Nvidia.GeForceExperience",
    
    # --- Web Browsers ---
    "Brave.Brave",
    "Google.Chrome.EXE",
    "Zen-Team.Zen-Browser",

    # --- Communication & Media & Game ---
    "Discord.Discord",
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher"
)

# --- SCRIPT LOGIC (No need to edit below this line) ---

try {
    Get-Command "winget" -ErrorAction Stop | Out-Null
    Write-Host "[OK] Winget is available." -ForegroundColor Green
}
catch {
    Write-Host "[ERROR] winget is not installed or not in your PATH." -ForegroundColor Red
    Write-Host "[INFO] Please install 'App Installer' from the Microsoft Store to continue." -ForegroundColor Yellow
    exit 1
}

Write-Host "[INFO] Updating winget sources..." -ForegroundColor Cyan
winget source update

Write-Host "[INFO] Installing specified packages..." -ForegroundColor Cyan
foreach ($package in $packages) {
    Write-Host "--- Installing: $package ---" -ForegroundColor Yellow
    winget install --id $package --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Successfully installed $package" -ForegroundColor Green
    } else {
        Write-Host "[FAIL] Failed to install $package. Exit code: $LASTEXITCODE" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "[DONE] Script finished! All specified packages have been processed." -ForegroundColor Green
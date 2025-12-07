# ##################################################################
#                  Windows Winget App Install Script               #
# ##################################################################

Write-Host 'Starting package installation for Windows...'

# Try to unblock this script (no-op if not needed)
try { Unblock-File -Path $MyInvocation.MyCommand.Path -ErrorAction SilentlyContinue } catch {}

# Warn if not running as Administrator (some installs may require elevation)
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Warning "It's recommended to run this script as Administrator for best results."
}

# Ensure winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Warning 'Windows Package Manager (winget) is not installed.'
    Write-Host "We'll open the Microsoft Store page for 'App Installer' (includes winget)."
    Write-Host 'After installation completes, please re-run this script.'
    try {
        Start-Process "ms-windows-store://pdp/?productId=9NBLGGH4NNS1"
    } catch {
        Write-Host "If the Store didn't open, install 'App Installer' manually from: https://aka.ms/getwinget"
    }
    exit 1
}

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
    "Flow-Launcher.Flow-Launcher",
    "Bitwarden.Bitwarden",
    "DBeaver.DBeaver.Community",
    "Postman.Postman",
    "Stremio.StremioService",
    "Microsoft.VisualStudioCode",
    "Microsoft.VisualStudio.2022.Community",
    "Anysphere.Cursor",
    "Google.Antigravity",
    "Amazon.Kiro",
    "Mozilla.Thunderbird",
    "JDownloader.JDownloader",
    "ExifCleaner.ExifCleaner",
    "Obsidian.Obsidian",
    "xanderfrangos.twinkletray",
    "File-New-Project.EarTrumpet",
    "Nvidia.GeForceExperience",
    "DelugeTeam.Deluge"
    
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

foreach ($package in $packages) {
    Write-Host "--- Installing: $package ---" -ForegroundColor Yellow
    try {
        winget install --id $package --silent --accept-package-agreements --accept-source-agreements
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Successfully installed $package" -ForegroundColor Green
        } else {
            Write-Host "[FAIL] Failed to install $package. Exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "[ERROR] $package installation failed: $_"
    }
}

Write-Host "[DONE] Script finished! All specified packages have been processed." -ForegroundColor Green


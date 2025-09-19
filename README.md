## Winget Download
# Download the latest version
Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "AppInstaller.msixbundle"

# Install the downloaded package
Add-AppxPackage .\AppInstaller.msixbundle


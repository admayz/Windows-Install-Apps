# Winget Installation Guide / Winget Kurulum Rehberi

This guide explains how to download, install, and use **Winget (Windows Package Manager)**.  
Bu rehber, **Winget (Windows Package Manager)** aracını indirip kurmayı ve kullanmayı açıklar.  

---

## 1. Download Winget / Winget İndir

**English:** Run the following command in PowerShell to download the latest version of Winget.  
**Türkçe:** Winget’in en güncel sürümünü indirmek için PowerShell üzerinde şu komutu çalıştırın.  

```powershell
Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "AppInstaller.msixbundle"
```


# Winget Download
## Download the latest version
Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "AppInstaller.msixbundle"

## Install the downloaded package
Add-AppxPackage .\AppInstaller.msixbundle

#Install
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
.\install_apps.ps1

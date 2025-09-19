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

## 2. Install Winget / Winget Kurulumunu Yap

**English:** Install the downloaded package using this command.  
**Türkçe:** İndirilen paketi yüklemek için bu komutu kullanın.

```powershell
Add-AppxPackage .\AppInstaller.msixbundle
```

## 3. Enable Script Execution / Script Çalıştırmayı Etkinleştir

**English:** Allow PowerShell scripts to run by setting the Execution Policy.
**Türkçe:** PowerShell scriptlerinin çalışmasına izin vermek için Execution Policy ayarını değiştirin.

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

## 4. Run Your App Installation Script / Uygulama Kurulum Scriptini Çalıştır

**English:** Now you can run your custom installation script (example: install_apps.ps1).
**Türkçe:** Artık kendi kurulum scriptinizi çalıştırabilirsiniz (örnek: install_apps.ps1).

```powershell
.\install_apps.ps1
```

## 5. Verify Winget Installation / Winget Kurulumunu Doğrula

**English:** Check if Winget is installed correctly by running:
**Türkçe:** Winget’in doğru kurulup kurulmadığını kontrol etmek için şu komutu çalıştırın:

```powershell
winget --version
```

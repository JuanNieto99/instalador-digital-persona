@echo off
title finger installer

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

powershell Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
powershell Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All" -NoRestart
powershell Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
powershell winget install --interactive --exact dorssel.usbipd-win 

set source="C:\Users\finger"
set destination="\\wsl.localhost\Ubuntu\home\instalacion-sdk-digitalpersona"
set programFile="C:\finger"

if not exist %programFile% mkdir %programFile%
if not exist %destination% mkdir %destination%

xcopy %source%\instalacion-sdk-digitalpersona %destination% /E /I /Y
xcopy %source%%\finger.ps1% %programFile% /Y
xcopy %source%%\RunHidden% %programFile% /Y

powershell wsl --install -d Ubuntu -n
powershell "wsl --setdefault Ubuntu";
powershell "wsl -d ubuntu sudo apt update"; 
powershell "wsl -d ubuntu sudo apt install linux-tools-generic hwdata"; 
powershell "wsl -d ubuntu sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic/usbip 20"; 
powershell "wsl -d ubuntu bash /home/instalacion-sdk-digitalpersona/sdk.sh";
powershell -command "& {Set-ExecutionPolicy RemoteSigned}"

schtasks /create /tn "FingerTask" /tr "PowerShell.exe cd C:\finger ; .\RunHidden.vbs" /sc onstart /RL HIGHEST /F

echo instalacion completada

pause >nul
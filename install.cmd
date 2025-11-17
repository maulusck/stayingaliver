@color 1F
@pushd %~dp0
@setlocal enabledelayedexpansion
@echo off
SET EXE=%~dp0stayingaliver.exe
SET ICON=%~dp0res\icon.ico
SET SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Stayingaliver.lnk
if exist "%EXE%" (
    powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%SHORTCUT%'); $s.TargetPath='%EXE%'; $s.IconLocation='%ICON%'; $s.Save()"
    echo Shortcut created at "%SHORTCUT%".
    choice /N /M "Do you want to enable auto-start at login? [Y/N]: "

    if !errorlevel! EQU 1 (
        copy /Y "%SHORTCUT%" "%SHORTCUT:Programs=Programs\Startup%"
        echo Autostart shortcut created at "%SHORTCUT:Programs=Programs\Startup%".
    )
) else (
echo ERROR: %EXE% not found! Please run build.cmd first.
)
endlocal
pause
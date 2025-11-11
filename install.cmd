@color 0B
@pushd %~dp0
@echo off
set EXE=%~dp0stayingaliver.exe
set ICON=%~dp0res\icon.ico
set SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Stayingaliver.lnk

if exist "%EXE%" (
    powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%SHORTCUT%');$s.TargetPath='%EXE%';$s.IconLocation='%ICON%';$s.Save()"
    echo Shortcut created at %SHORTCUT%.
) else (
    echo ERROR: %EXE% not found! Please run build.cmd first.
)

pause

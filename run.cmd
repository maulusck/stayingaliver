@pushd %~dp0
@echo off
set _script=.\stayingaliver.ps1
@title [%_script%]
echo Loading...
powershell -ep bypass "%_script%" %*
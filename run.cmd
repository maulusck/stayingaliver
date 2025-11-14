@pushd %~dp0
@echo off
SET _script=.\stayingaliver.ps1
@title [%_script%]
echo Loading...
powershell -ep bypass "%_script%" %*
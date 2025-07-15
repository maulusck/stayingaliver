@echo off
if "%~1"=="" (
  echo Usage: %~nx0 ^<filename^> ^| drag and drop a file onto this script
  pause
  exit /b 1
)

powershell -NoProfile -Command ^
  "$f='%~1';" ^
  "[Convert]::ToBase64String([IO.File]::ReadAllBytes($f)) | Out-File -Encoding ascii ($f+'.b64')"

echo %~1 converted to %~1.b64
pause

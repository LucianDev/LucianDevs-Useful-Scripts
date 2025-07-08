@echo off
:: Kill the server if running
taskkill /IM SCUMServer.exe /F

:: Wait for 30 seconds
timeout /t 30 /nobreak

:: Start the server via your custom script
start "" "C:\servers\scum\start-server.bat"

@echo off
:: 7 Days to Die Windows Firewall Configuration Script
:: Must be run as Administrator

echo.
echo === Configuring Windows Firewall for 7 Days to Die ===

:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [ERROR] Please run this script as Administrator.
    pause
    exit /b
)

:: Game Port (TCP/UDP 26900)
echo Adding rule for Game Port 26900 (TCP/UDP)...
netsh advfirewall firewall add rule name="7D2D Game TCP 26900" dir=in action=allow protocol=TCP localport=26900
netsh advfirewall firewall add rule name="7D2D Game UDP 26900" dir=in action=allow protocol=UDP localport=26900

:: Steam Port (UDP 26901)
echo Adding rule for Steam Port 26901 (UDP)...
netsh advfirewall firewall add rule name="7D2D Steam UDP 26901" dir=in action=allow protocol=UDP localport=26901

:: Query Port (UDP 26902)
echo Adding rule for Query Port 26902 (UDP)...
netsh advfirewall firewall add rule name="7D2D Query UDP 26902" dir=in action=allow protocol=UDP localport=26902

:: Optional Web Dashboard (TCP 8080)
set /p allowWeb=Do you want to allow TCP port 8080 for a web dashboard? (Y/N): 
if /I "%allowWeb%"=="Y" (
    echo Adding rule for Web Dashboard TCP 8080...
    netsh advfirewall firewall add rule name="7D2D Web Dashboard TCP 8080" dir=in action=allow protocol=TCP localport=8080
) else (
    echo Skipping TCP 8080 rule.
)

:: Optional Telnet Console (TCP 8081)
set /p allowTelnet=Do you want to allow TCP port 8081 for Telnet console access? (Y/N): 
if /I "%allowTelnet%"=="Y" (
    echo Adding rule for Telnet Console TCP 8081...
    netsh advfirewall firewall add rule name="7D2D Telnet TCP 8081" dir=in action=allow protocol=TCP localport=8081
) else (
    echo Skipping TCP 8081 rule.
)

echo.
echo === Firewall configuration complete. ===
pause

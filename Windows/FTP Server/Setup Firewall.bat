@echo off

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Running with administrator privileges...

:: Open FTP control port (21)
netsh advfirewall firewall add rule name="FTP Port 21" dir=in action=allow protocol=TCP localport=21

:: Open FTP passive port range (50000–50100)
netsh advfirewall firewall add rule name="FTP Passive Ports" dir=in action=allow protocol=TCP localport=50000-50100

echo.
echo FTP ports opened successfully.
pause

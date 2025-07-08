@echo off

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Running with administrator privileges...

:: Open V Rising game port (UDP 9876)
netsh advfirewall firewall add rule name="V Rising Game Port" dir=in action=allow protocol=UDP localport=9876

:: Open V Rising Steam query port (UDP 9877)
netsh advfirewall firewall add rule name="V Rising Steam Query Port" dir=in action=allow protocol=UDP localport=9877

:: Open V Rising RCON port (TCP 25575)
netsh advfirewall firewall add rule name="V Rising RCON Port" dir=in action=allow protocol=TCP localport=25575

echo.
echo V Rising server ports opened successfully.
pause

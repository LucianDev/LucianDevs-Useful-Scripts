@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo Opening SCUM server ports in Windows Firewall...

:: Query Port - 27015 UDP
netsh advfirewall firewall add rule name="SCUM Query Port" dir=in action=allow protocol=UDP localport=27015

:: Server Port - 7777 UDP
netsh advfirewall firewall add rule name="SCUM Server Port" dir=in action=allow protocol=UDP localport=7777

:: Client Port - 7779 TCP
netsh advfirewall firewall add rule name="SCUM Client Port" dir=in action=allow protocol=TCP localport=7779

echo.
echo Ports opened successfully.
pause

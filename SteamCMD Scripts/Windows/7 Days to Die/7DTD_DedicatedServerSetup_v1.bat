@echo off
setlocal

REM Ask the user for the location of steamcmd
set /p STEAMCMD_PATH="Please enter the location of steamcmd (copy & paste the path): "

REM Create Servers folder if it doesn't exist
if not exist "C:\Servers" mkdir "C:\Servers"

REM Create 7dtd folder inside Servers folder if it doesn't exist
if not exist "C:\Servers\7dtd" mkdir "C:\Servers\7dtd"

REM Check if the steamcmd.exe exists at the specified path
if not exist "%STEAMCMD_PATH%\steamcmd.exe" (
    echo Error: steamcmd.exe not found at the specified path.
    exit /b
)

REM Change directory to steamcmd location
cd /d "%STEAMCMD_PATH%"

REM Run steamcmd.exe and execute commands
steamcmd +login anonymous +force_install_dir "C:\Servers\7dtd" +app_update 294420 +quit

echo SteamCMD process completed.

REM Clear the console
cls

REM Open the 7dtd folder
start "" "C:\Servers\7dtd"

REM Inform user to open required ports in firewall
echo Please open the following ports in your firewall: 26900 - 26902, 8080 - 8082
echo.
echo Opening Windows Firewall settings...
control /name Microsoft.WindowsFirewall
echo.
set /p CONFIRM_FIREWALL="Once done, type 'yes' or 'y' to proceed: "

REM Check user confirmation for firewall
if /i "%CONFIRM_FIREWALL%"=="yes" (
    echo Proceeding to the next step...
    REM Clear the console
    cls
) else if /i "%CONFIRM_FIREWALL%"=="y" (
    echo Proceeding to the next step...
    REM Clear the console
    cls
) else (
    echo Confirmation not received. Exiting script.
    exit /b
)

REM Open serverconfig.xml file and inform the user to modify settings
start notepad.exe "C:\Servers\7dtd\serverconfig.xml"
echo Please modify the server settings in serverconfig.xml as needed.

REM Clear the console
cls

REM Inform the user about running startdedicated.bat
echo You can now run startdedicated.bat within the 7dtd folder to start your server.

:WAIT_FOR_EXIT
REM Wait for user input to close the console
set /p "EXIT_PROMPT=Type 'exit' to close this console: "
if /i "%EXIT_PROMPT%"=="exit" (
    exit
) else (
    goto :WAIT_FOR_EXIT
)

:end
endlocal

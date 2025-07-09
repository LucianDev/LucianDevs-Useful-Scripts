@echo off

:: === CONFIGURATION ===
set ServerPath=C:\servers\7daystodie
set SteamCMDPath=C:\servers\steamcmd
set InstallPath=%ServerPath%
set ConfigFile=myserverconfig.xml
set LogDir=%InstallPath%\logs

:: === CREATE LOG DIRECTORY IF IT DOESN'T EXIST ===
if not exist "%LogDir%" (
    mkdir "%LogDir%"
)

:: === BUILDING TIMESTAMP FOR LOGFILE ===

:: Check if WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_start

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
    IF "%%~L"=="" GOTO s_done
    SET _yyyy=%%L
    SET _mm=00%%J
    SET _dd=00%%G
    SET _hour=00%%H
    SET _minute=00%%I
    SET _second=00%%K
)
:s_done

:: Pad digits with leading zeros
SET _mm=%_mm:~-2%
SET _dd=%_dd:~-2%
SET _hour=%_hour:~-2%
SET _minute=%_minute:~-2%
SET _second=%_second:~-2%

SET LOGTIMESTAMP=__%_yyyy%-%_mm%-%_dd%__%_hour%-%_minute%-%_second%

:s_start

:: Set final log file path
SET LogFile=%LogDir%\7dtd_log%LOGTIMESTAMP%.txt

:: === UPDATE SERVER ===
echo Updating 7 Days to Die Dedicated Server...
"%SteamCMDPath%\steamcmd.exe" +force_install_dir "%InstallPath%" +login anonymous +app_update 294420 validate +quit

:: === START SERVER ===
cd /d "%InstallPath%"
echo Starting 7 Days to Die Dedicated Server with config: %ConfigFile%
echo Writing log to: %LogFile%

start "" 7DaysToDieServer.exe -logfile "%LogFile%" -quit -batchmode -nographics -configfile=%ConfigFile% -dedicated

echo.
echo Server is launching in the background...
pause

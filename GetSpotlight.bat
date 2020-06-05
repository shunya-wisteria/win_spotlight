@echo off
rem -------------------------------------
rem GetSpotlight.bat
rem  Set setting.ini before Execute 
rem -------------------------------------

rem import constants value from ini file
setlocal enabledelayedexpansion
for /f "tokens=1,* delims==" %%a in (setting.ini) do (
    set %%a=%%b
)

rem check target folder not existed
if not exist "%folder%\" (
    rem create target folder
    mkdir %folder%
)

rem create subfolder
set subfolder=%folder%\%DATE:~-10,4%%DATE:~-5,2%%DATE:~-2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
mkdir %subfolder%

rem copy spotlight files to target subfolder
copy %LOCALAPPDATA%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\* %subfolder%

rem change suffix to jpg
ren %subfolder%\* *.jpg

@echo off
setlocal enabledelayedexpansion
title QuotaOS Beta 1
color 0f

:prestart
for /f %%a in ('echo prompt $E^| cmd') do set "\e=%%a"

:: Finding out how many users there are
cd system\memory

if exist users.csv (
	for /f "tokens=1-4 delims=," %%A in (users.csv) do (
	set "users[%%~A][id]=%%~A"
	set "users[%%~A][level]=%%~B"
    set "users[%%~A][name]=%%~C"
    set "users[%%~A][password]=%%~D"
	)
)

cd ..\..

:start
cls
echo.
echo    /#####################################\
echo    #          Welcome to QuotaOS         #
echo    \#####################################/
echo.
echo          1 ------------------- Login
echo          2 ---------- Create Account
echo.
set /p "option="

:: Checks which option the user picked
if "%option%"=="2" (
    goto create
) else if "%option%"=="1" (
	cls
    goto login
) else if /i "%option%"=="qLog" (
    goto qLog
) else (
    cls
    goto start
)
exit

:create

echo.
echo    /#####################################\
echo    #          Name Your Account          #
echo    \#####################################/
echo.
set /p "accname="
echo.
echo.
echo    /#####################################\
echo    #         Set Account Password        #
echo    \#####################################/
echo.
set /p "accpass="

:: Creates the username and password memory files
for /f "delims=," %%A in (system\memory\id.global) do (
	set /a global_id=%%A-1
	> system\memory\id.global echo !global_id!
)
>> system\memory\users.csv echo %global_id%,2,%accname%,%accpass%
mkdir users\%accname% && mkdir users\%accname%\Documents & mkdir users\%accname%\Preferences
<nul set /p "= 0f" > users\%accname%\Preferences\systemColor.pref
<nul set /p "= 2" > users\%accname%\user.lvl
goto prestart

:login
cls
echo=
echo=   /#####################################\
echo=   #           Login to QuotaOS          #
echo=   \#####################################/     
echo=
echo=         1 ---- Login to an account
echo=         2 ---------------- Go back
echo=
echo=          Available Users:
set "names="
for /f "tokens=2 delims==" %%A in ('set users[ ^| find "name"') do set "names=!names!,%%~A"
set "names=!names:~1!"
echo=          %\e%[48;2;0;255;0;38;2;0;0;0m!names!%\e%[0m
echo=
set /p "option="
if "%option%"=="1" goto loginto
if "%option%"=="2" goto start
cls
goto login

:loginto
echo.
set /p "user_name=Enter Username: "
if %user_name%==qLog goto qLog
findstr ",%user_name%," system\memory\users.csv >nul || (
    goto login
)
echo.
set /p "password=Enter Password: "

for /f "tokens=4 delims=," %%A in ('findstr ",%user_name%," system\memory\users.csv 2^>nul') do set "actual_password=%%~A"
if not "%actual_password%"=="%password%" (
    echo %actual_password%
	echo %password%
	pause
)

for /f "tokens=2 delims=," %%A in ('findstr ",%user_name%," system\memory\users.csv 2^>nul') do set "acclvl0=%%~A"
for /f "tokens=1 delims=," %%A in ('findstr ",%user_name%," system\memory\users.csv 2^>nul') do set /a "accid0=%%~A*-1"
set accname0=%user_name%
set accpass0=%password%
mss.bat

exit

:qLog
set accname0=qLog
set accpass0=qLog

cd system\temp & mkdir users\%accname% && mkdir users\%accname%\Documents & mkdir users\%accname%\Preferences
<nul set /p "= 0f" > users\%accname%\Preferences\systemColor.pref
<nul set /p "= 1" > users\%accname%\user.lvl
cd ..\..
mss.bat
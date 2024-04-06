@echo off
setlocal enabledelayedexpansion
title QuotaOS Alpha 16, Third 3
color 0f
:prestart

:: Finding out how many users there are
cd system\memory
if exist username0.txt (
	for /f "delims=" %%a in (username0.txt) do (
		set "accname=%%a"
		set "usernameFile=username1"
	)
) else (
	set "usernameFile=username0"
)

if exist username1.txt (
	for /f "delims=" %%b in (username1.txt) do (
		set "accname2=%%b"
	)
)

if exist password0.txt (
	for /f "delims=" %%c in (password0.txt) do (
		set "accpass=%%c"
		set "passwordFile=password1"
	)
) else (
	set "passwordFile=password0"
)

if exist password1.txt (
	for /f "delims=" %%d in (password1.txt) do (
		set "accpass2=%%d"
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
echo          1.                    Login
echo          2.           Create Account
echo.
set /p "option="

:: Checks which option the user picked
if %option%==2 (
	goto create
) else if %option%==1 (
	goto login
) else if /i %option%==qLog (
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
<nul set /p "= %accname%" > system\memory\%usernameFile%.txt
<nul set /p "= %accpass%" > system\memory\%passwordFile%.txt
mkdir users\%accname% && mkdir users\%accname%\Documents & mkdir users\%accname%\Preferences
<nul set /p "= 0f" > users\%accname%\Preferences\systemColor.pref

goto prestart

:login
cls
echo.
echo    Available Users: %accname%  %accname2%
echo    /#####################################\
echo    #           Login to QuotaOS          #
echo    \#####################################/     
echo.
echo          1.     Login to an account 
echo          2.                 Go back 
echo.
set /p "option="
if %option%==1 goto loginto
if %option%==2 goto start
goto login

:loginto
echo.
echo    /#####################################\
echo    #            Enter Username           #
echo    \#####################################/
echo.
set /p "accnamelogin="
if %accnamelogin%==%accname% (
	echo.
	echo.
	echo  Logging into %accname%
	echo    /#####################################\
	echo    #            Enter Password           #
	echo    \#####################################/
	echo.
	set /p "accpasslogin="
	goto loginconf
) else (
	echo.
	echo.
	echo    /#####################################\
	echo    #       ERROR: INVALID USERNAME       #
	echo    \#####################################/
	echo.
	echo Press any key to retry
	pause >nul
	cls
	goto loginto
)

if %accnamelogin%==%accname2% (
	echo.
	echo.
	echo  Logging into %accname2%
	echo    /#####################################\
	echo    #            Enter Password           #
	echo    \#####################################/
	echo.
	set /p "accpasslogin="
	pause
	goto loginconf2
) else (
	echo.
	echo.
	echo    /#####################################\
	echo    #       ERROR: INVALID USERNAME       #
	echo    \#####################################/
	echo.
	echo Press any key to retry
	pause >nul
	cls
	goto loginto
)

:loginconf
if %accpasslogin%==%accpass% (
	set accname0=%accname%
	set accpass0=%accpass%
	<nul set /p "= 1" > system\temp\booted.tmp
	mss.bat
) else (
	echo.
	echo.
	echo    /#####################################\
	echo    #       ERROR: INVALID PASSWORD       #
	echo    \#####################################/
	echo.
	echo Press any key to retry
	pause >nul
	cls
	goto loginto
)

:loginconf2
if %accpasslogin%==%accpass2% (
	set accname0=%accname2%
	set accpass0=%accpass2%
	<nul set /p "= 1" > system\temp\booted.tmp
	mss.bat
) else (
	echo.
	echo.
	echo    /#####################################\
	echo    #       ERROR: INVALID PASSWORD       #
	echo    \#####################################/
	echo.
	echo Press any key to retry
	pause >nul
	cls
	goto loginto
)

:qLog

set accname0=qLog
set accpass0=qLog
<nul set /p "= 1" > system\temp\booted.tmp

mkdir system\temp\tempusers\qLog && mkdir system\temp\tempusers\qLog\Documents & mkdir system\temp\tempusers\qLog\Preferences
<nul set /p "= 0f" > system\temp\tempusers\qLog\Preferences\systemColor.pref

mss.bat
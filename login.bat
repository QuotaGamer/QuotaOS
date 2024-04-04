@echo off
title QuotaOS Alpha 16, Third 2
color 0a

if not exist system\temp (
	mkdir system\temp
)

if not exist system\memory (
	mkdir system\temp
)

if exist system\temp\booted.tmp (
	DEL /Q system\temp\booted.tmp
)
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
	for /f "delims=" %%a in (password0.txt) do (
		set "accpass=%%a"
		set "passwordFile=password1"
	)
) else (
	set "passwordFile=password0"
)

if exist password1.txt (
	for /f "delims=" %%b in (password1.txt) do (
		set "accpass2=%%b"
	)
)
cd ..\..


:start
cls
echo.
echo  /##################################\
echo  #                                  #
echo  #        Welcome to QuotaOS        #
echo  #                                  #
echo  # 1.           Login to an account #
echo  # 2.             Create an account #
echo  #                                  #
echo  \##################################/
echo.
set /p "option="

:: Checks which option the user picked
if %option%==2 (
	goto create
) else if %option%==1 (
	goto login
) else (
	cls
	goto start
)
exit

:create
echo.
echo /#####################################\
echo #          Name Your Account          #
echo \#####################################/
echo.
set /p "accname="
echo.
echo /#####################################\
echo #         Set Account Password        #
echo \#####################################/
echo.
set /p "accpass="

:: Creates the username and password memory files
<nul set /p "= %accname%" > system\memory\%usernameFile%.txt
<nul set /p "= %accpass%" > system\memory\%passwordFile%.txt

goto prestart

:login
cls
echo.
echo            Login to QuotaOS         
echo.
echo    1.             List all accounts 
echo    2.           Login to an account 
echo    3.                       Go back 
echo.
set /p "option="
if %option%==1 (
	echo.
	echo %accname%, %accname2%
	echo.
	pause
	goto login
) else if %option%==2 (
	goto loginto
) else if %option%==3 (
	goto start
) else (
	goto login
)

:loginto
echo.
echo /#####################################\
echo #          Account Username?          #
echo \#####################################/
echo.
set /p "accnamelogin="
if %accnamelogin%==%accname% (
	echo.
	echo  Logging into %accname%
	echo /#####################################\
	echo #            Enter Password           #
	echo \#####################################/
	echo.
	set /p "accpasslogin="
	goto loginconf
) else if %accnamelogin%==%accname2% (
	echo.
	echo  Logging into %accname2%
	echo /#####################################\
	echo #            Enter Password           #
	echo \#####################################/
	echo.
	set /p "accpasslogin="
	goto loginconf2
)

:loginconf
if %accpasslogin%==%accpass% (
	set accname0=%accname%
	set accpass0=%accpass%
	<nul set /p "= 1" > system\temp\booted.tmp
	mss.bat
) else (
	echo /#####################################\
	echo #       ERROR: INVALID PASSWORD       #
	echo \#####################################/
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
	echo /#####################################\
	echo #       ERROR: INVALID PASSWORD       #
	echo \#####################################/
	echo.
	echo Press any key to retry
	pause >nul
	cls
	goto loginto
)
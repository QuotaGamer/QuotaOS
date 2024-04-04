@echo off
cls
title QuotaOS Alpha 16, Third 2

if exist system\temp\booted.tmp (
	goto desktop
) else (
	color 0c
	echo You accessed MSS.BAT using an unauthorized method.
	echo In 3 seconds you will be exited.
	timeout /t 3
	exit
)

:desktop
echo.
echo           Welcome to QuotaOS
echo.
echo    1.                  Applications
echo    2.               System Settings
echo    3.                 About QuotaOS
echo    4.                       Log Out
echo    (Logged in as %accname0%)
echo.
set/p "option="
if %option%==1 goto apps
if %option%==2 goto settings
if %option%==3 goto about
if %option%==4 goto logout
goto desktop

:apps
echo Applications are temporarily disabled.
goto desktop

:settings
cls
echo /#####################################\
echo #           System Settings           #
echo \#####################################/
echo.
echo X. Go to desktop
echo.
echo 1. Change system colors
echo 2. Open wallpaper folder
set/p "choose2=Choose:"
if %choose2%==X goto desktop
if %choose2%==1 goto colors
if %choose2%==2 goto wallfolder
goto settings


:about
cls
type system\TextIMGS\about.net
pause>nul
goto desktop

:logout
DEL /Q system\temp\booted.tmp
exit
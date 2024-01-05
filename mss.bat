@echo off
color 0a

title Quota OS Alpha Build 16T1 - OS
set "version=Alpha-16T1"

IF EXIST "update.bat" DEL /Q "update.bat"
IF EXIST "UpdateFiles" RD "BatchOS-main" /S /Q
IF EXIST "UpdateFiles" RD "Update" /S /Q

set "logtest=%loginuse%0"
if %logtest% == 10 goto desktop
goto LOGINERR

:LOGINERR
cls
set "userold=%username%"
set "username=guest"
color 04
echo WARNING: You logged in using a method that isn't the normal method of logging in.
echo Please press any key to load the OS as the Guest User.
echo Old Username: %userold%
pause >nul
color 0a
goto desktopguest

:desktop
IF EXIST "update.bat" DEL /Q "update.bat"
IF EXIST "UpdateFiles" RD "BatchOS-main" /S /Q
IF EXIST "UpdateFiles" RD "Update" /S /Q
cls
if %username%==guest goto desktopguest
if %accName%==qlog (
	type users\qlog\Settings\background.txt
) else (
	type users\admin\Settings\background.txt
)
echo.
echo     Welcome to QuotaOS
echo	      Version %version%
echo.
echo        User: %accName%
echo.
echo 1.          Apps
echo 2.     System Settings
echo 3.      About QuotaOS
echo 4.        Add User
echo 5.         Log Out
echo.
set/p "choose1=Choose:"
if %choose1%==1 goto apps
if %choose1%==2 goto settings
if %choose1%==3 login.bat
if %choose1%==4 goto about
if %choose1%==5 goto exit
goto desktop

:desktopguest
cls
type user\admin\Settings\background.txt
echo.
echo     Welcome to QuotaOS
echo.
echo       Guest Session
echo.
echo 1         Apps
echo 2     About QuotaOS
echo 3    About QuotaOS
echo 4       Log Out
set/p "choose4=Choose:"
if %choose4%==1 goto apps
if %choose4%==2 goto about
if %choose4%==3 goto quit
if %choose4%==4 login.bat
goto desktopguest

:restart
set username=
login.bat

:quit
exit

:about
cls
type system\TextIMGS\about.net
pause>nul
goto desktop

:settings
cls
echo /#####################################\
echo #           System settings           #
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

:apps
cls
cd soft
type applist.net
echo.
set /p "apptoRun=Which app? "
%apptoRun%.bat
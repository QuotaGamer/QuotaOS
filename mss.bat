@echo off
color 0a

title Quota OS Alpha Build 15 - OS
set "version=Alpha-15"

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
color 0c
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
if %accName%==qLog (
	type users\qLog\Settings\background.txt
) else (
	type users\admin\Settings\background.txt
)
echo.
echo     Welcome to QuotaOS
echo	      Version %version%
echo.
echo        User: %accName%
echo.
echo 1          Apps
echo 2     System Settings
echo 3       Switch User
echo 4         Reboot
echo 5      About QuotaOS
echo 6          Exit
echo.
set/p "choose1=Choose:"
if %choose1%==1 goto apps
if %choose1%==2 goto settings
if %choose1%==3 login.bat
if %choose1%==4 goto restart
if %choose1%==5 goto about
if %choose1%==6 goto exit
goto desktop

:desktopguest
cls
type user\default\background\bg.net
echo.
echo     Welcome to QuotaOS
echo.
echo       Guest Session
echo 1       Go to Apps
echo 2     About QuotaOS
echo 3     Exit QuotaOS
echo 4       Add User
echo 5       Log Out
set/p "choose4=Choose:"
if %choose4%==1 goto apps
if %choose4%==2 goto about
if %choose4%==3 goto quit
if %choose4%==4 goto usraddg
if %choose4%==5 login.bat
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
echo ######## System settings ##############
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

:wallfolder
start c:\windows\explorer.exe user\%username%\background
goto desktop

:colors
cls
set/p "colors=Type colors value:"
echo Applying changes...
timeout 5 >nul
color %colors%
goto desktop

:apps
cls
cd soft
echo     Apps:
type applist.net
echo.
echo or type: softapp to open your downloaded apps.
set/p "softname=Type app name to run:"
if %softname%==softapp goto sapps
start %softname%.bat
cd..
goto desktop

:sapps
cls
cd..
cd user\%username%\download\
set/p "softname=Type downloaded app name to run:"
start %softname%.bat
cd..
cd..
cd..
goto desktop
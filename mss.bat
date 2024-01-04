@echo off
color 0a

title Quota OS Alpha Build 14 - OS
set "version=Alpha-14"

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
echo WARNING: You logged in using a login method that is not the normal method of logging in.
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
type user\%username%\background\bg.txt
echo.
echo     Welcome to QuotaOS
echo	      Version %version%
echo.
echo        User: %username%
echo 1       Go to Apps
echo 2     About QuotaOS
echo 3     Exit QuotaOS
echo 4    System Settings
echo 5     Reboot system
echo 6       Add User
echo 7      Switch User
echo 8   Check For Updates
echo.
set/p "choose1=Choose:"
if %choose1%==1 goto apps
if %choose1%==2 goto about
if %choose1%==3 goto quit
if %choose1%==4 goto settings
if %choose1%==5 goto restart
if %choose1%==6 goto usradd
if %choose1%==7 login.bat
if %choose1%==8 goto updatecheck
goto desktop

:updatecheck
IF EXIST "update.bat" DEL /Q "update.bat"
IF EXIST "UpdateFiles" RD "BatchOS-main" /S /Q
IF EXIST "UpdateFiles" RD "Update" /S /Q
set local=%version%
set localtwo=%local%
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pastebin.com/raw/qPnXWs6r', 'update.bat')"
CALL update.bat
goto check-2


:: check-2 is where it checks if your remote matches with your local.
:check-2
IF "%local%"=="%localtwo%" goto :yes
IF "%local%" GEQ "%localtwo%" goto :no

:yes
cls
echo No updates found. Version: %localtwo% , Server Version: %local%
echo.
echo Press any key to return to desktop.
pause >nul
goto desktop

:no
cls
echo Update found! Version: %localtwo% , Server Version: %local%
echo.
set/p instupdate="Install update? (Y/N)= "
if %instupdate% == Y goto instupdate1
if %instupdate% == N goto desktop
IF EXIST "update.bat" DEL /Q "update.bat"
echo ERROR! Invalid option! Press any key to retry.
pause >nul
goto no

:instupdate1
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/QuotaGamer/BatchOS/archive/refs/heads/main.zip', 'update.zip')"
powershell -Command "Expand-Archive -Path update.zip -DestinationPath ./"
rename BatchOS-main Update
IF EXIST "update.zip" DEL /Q "update.zip"
echo Done! Go ahead and run UpdateInstaller.bat to install the update! (Press any key to exit.)
pause >nul
exit

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


:usraddg
cls
echo.
set/p "user-add=What username?"
set/p "pass-add-g=What password?"
echo useradd **GUEST** :%username-add%,%pass-add%>>login-add.net
goto desktop

:usradd
cls
echo.
echo Checking your permissions...
if %username%==guest goto usraddg
if %username%==admin goto usraddv
if %username%==qlog goto usraddv
if not %username%==quota goto usradde
if not %username%==admin goto usradde

:usradde
cls
echo.
echo You are not a admin user!
echo.
echo Press any key to go back to the desktop.
pause >nul
goto desktop

:usraddv
cls
echo.
echo Add a user!
echo.
echo Note: you will have to contact a admin to get
echo your account added to the accounts list.
echo.
set/p "username-add=What username? "
set/p "pass-add=What password? "
set/p "pass-add-hint=What password hint? "
echo useradd:%username-add%,%pass-add%,%pass-add-hint%>>login-add.net
echo.
echo Press any key to go back to your desktop.
pause >nul
goto desktop

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
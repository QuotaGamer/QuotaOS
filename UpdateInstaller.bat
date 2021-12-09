@echo off

echo Are you sure you want to install the update? This will automatically delete all of your system's files and install everything in "Update".
set/p "YN=Yes or No? "
if %YN% == Yes goto install
if %YN% == No exit
echo Invalid Syntax!
timeout 3 >nul
exit

:install
IF EXIST "update.bat" del /Q "update.bat"
IF EXIST "soft" RD "soft" /s /q
IF EXIST "user" RD "user" /s /q
IF EXIST "system" RD "system" /s /q
IF EXIST "login-add.net" del /Q "login-add.net"
IF EXIST "readme.md" del /Q "readme.md"
IF EXIST "login.bat" del /Q "login.bat"
IF EXIST "bootloader.bat" del /Q "bootloader.bat"
IF EXIST ".gitignore" del /Q ".gitignore"
IF EXIST "mss.bat" del /Q "mss.bat"
cls
echo Deleting old files: Done!
pause
xcopy /I Update
xcopy /I Update\soft soft
xcopy /I Update\system system
xcopy /I /E Update\user\admin user\admin
xcopy /I /E Update\user\qlog user\qlog
xcopy /I /E Update\user\Template user\Template
xcopy /I /E Update\user\default user\default
IF EXIST "UpdateFiles" RD "BatchOS-main" /S /Q
IF EXIST "UpdateFiles" RD "Update" /S /Q
echo Alright, done! Press any key to go ahead and finish up this update by pressing any key to replace the UpdateInstaller with the new one.
pause >nul
xcopy Update\UpdateInstaller.bat UpdateInstaller.bat
exit
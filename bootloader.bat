@echo off
title EPIK Bootloader
color 0a
:EPIK
cls
echo.
echo /#################\
echo # EPIK Bootloader #
echo \#################/
echo.
echo 1: CMD
echo 2: QuotaOS
echo.
set/p "os=Choose an OS:"
if %os%==1 cmd.exe
if %os%==2 login.bat
goto EPIK
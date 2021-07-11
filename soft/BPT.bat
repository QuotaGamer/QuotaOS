@echo off
color 0a
title BPT
goto installer

:installer
cls
echo ######################################
echo ######## Package Installer ###########
echo ######################################
echo.
set/p "packageDir=Select Package Folder:"
echo Done!
set/p "mainBat=Select the main file in package folder:"
echo Done!
set/p "packagename=Select package name:"
echo Done!
echo.
echo Press any key to install package...
pause>nul
echo %packagename% >> list.net
echo start %packageDir%\%mainBat% >> %packagename%.bat
echo Installing package...
ping localhost-n 3 nul
cls
echo Package Installed!
pause>nul
goto installer
@echo off
title QuotaOS - App Import
:AI
cls
echo.
echo /################\
echo #  App Importer  #
echo \################/
echo.
set/p "appname=Enter name of app:
goto createNH

:createNH
cls
echo.
echo App Name: %appname%
echo.
set/p "appverif=Is this correct? (Y/N):"
if %appverif%==Y goto createNH-V
if %appverif%==N goto AI
if %appverif%==y goto createNH-V
if %appverif%==n goto AI
goto createNH

:createNH-V
cls
echo.
echo Verified!
echo.
echo Adding application...
echo %appname%>>applist.net
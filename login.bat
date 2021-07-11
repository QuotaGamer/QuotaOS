@echo off
color 0a
goto login


:login
cls
title QuotaOS v1.0-ALPHA-003
echo.
echo QUICK LOGIN ENABLED (qlog)
echo.
echo /################################\
echo ########## Accounts ##############
echo \################################/
echo.
echo Valid users: admin
echo.
echo Or you can log in as a guest.
echo.
echo Password Hints:
echo.
echo admin : admin
echo.
set/p "username=Account Name:"
if %username%==guest goto desktop
if %username%==qlog goto desktop
set/p "pass=Password:"
if %username%==admin goto verifi2
if not %username%==admin goto login


:verifi2
if %pass%==admin goto desktop
if not %pass%==admin goto login


:desktop
mss.bat
exit

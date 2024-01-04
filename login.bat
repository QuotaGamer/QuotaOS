@echo off
color 0a
set qloge=1
goto login

:login
cls
title QuotaOS Alpha 14 - Login
echo.
if %qloge% == 1 echo QUICK LOGIN ENABLED (qlog)
echo.
echo /################################\
echo #            Accounts            #
echo \################################/
echo.
echo Valid Users: admin
echo.
echo Or you can log in as a guest.
echo.
echo Password Hints:
echo.
echo admin : admin
echo.
set/p "username=Account Name:"
if %username%==guest goto desktop
if %qloge% == 1 if %username%==qlog goto desktop
set/p "pass=Password:"
if %username%==admin goto v-admin
if not %username%==admin goto login


:v-admin
if %pass%==admin goto desktop
if not %pass%==admin goto login

:desktop
set "loginuse=1"
mss.bat
exit

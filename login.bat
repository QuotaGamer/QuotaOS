@echo off
color 0a
title QuotaOS Alpha 15 - Login

if exist "username.txt" (
    for /f "delims=" %%a in (username.txt) do (
        set "accName=%%a"
        goto checkPassword
    )
) else (
    goto start
)

:checkPassword
cd "users\%accName%\Settings"
if exist "password.txt" (
    for /f "delims=" %%b in (password.txt) do (
        set "accPass=%%b"
        cd ..\..\..
        goto start
    )
) else (
    cd ..\..\..
    goto start
)

:start
cls
echo.
echo.
echo /################################\
echo #            Accounts            #
echo \################################/
echo.
echo.
echo             1. Create
echo             2. Log in
echo.
echo.
set /p "pick=Pick: "
if "%pick%"=="1" ( 
    goto create 
) else if "%pick%"=="2" (
    goto login 
) else ( 
    goto start 
)

:create
set /p "accName=Name your account: "
set /p "accPass=Make your password: "

<nul set /p "= %accName%" > username.txt
cd users & mkdir %accName% & cd %accName%
mkdir Documents & mkdir Downloads & mkdir Settings
cd Settings
<nul set /p "= %accPass%" > password.txt
cd ..\..\..
goto start

:login
set /p "loginName=Enter your username: "
set /p "loginPass=Enter your password: "

if "%loginName%"=="%accName%" (
    if "%loginPass%"=="%accPass%" (
        goto desktop
    )
) else if "%loginName%"=="admin" (
    if "%loginPass%"=="admin" (
        set "accName=admin"
        goto desktop
    )
) else if "%loginName%"=="qlog" (
    set "accName=qlog"
    goto desktop
) else (
    echo Invalid User.
    pause
    goto start
)

:desktop
set loginUse=1
mss.bat
exit

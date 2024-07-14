@echo off
title QuotaCalc v2

:start
color %color%
cls
echo=
echo=   /#####################################\
echo=   #             QuotaCalc V2            #
echo=   \#####################################/ 
echo=
echo=         1 -------------- Calculate
echo=         2 ---------------- Go back
echo=
set /p "option="
if %option%==1 (
	goto calc
) else if %option%==2 (
	set "fromApp=true"
	mss.bat
)
goto start

:calc
color %color%
echo=
echo=  Acceptable Operators: +,-,*,/
echo=
set /p "OPERATION=Enter an equation: "
set /a "RESULT=%OPERATION%"
echo= %result%
echo=
echo= Press any key to return
pause >nul
goto start
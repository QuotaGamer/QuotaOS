@echo off
title QuotaCalc
color 0a
goto calc

:calc
cls
set/p "working=What is your equasion? (Acceptable variables: +,*,/,-):"
set/a win = %working%
echo The answer is %win%
pause>nul
goto calc
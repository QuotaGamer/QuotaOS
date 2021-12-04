@echo off
color 0a
title Beta quizgame made in NANO on Quota's BatchOS!
echo.
echo Your user is %username%, so I'll be calling you that from now on :)
echo.
echo Press any key to start the quiz.
pause >nul
goto quiz

:q1
color 0d
cls
echo.
echo Welcome to the quiz!
echo.
echo.
echo Question 1:
echo.
echo What is your username? (Hint: it shows at the start of the game)
echo.
echo 1: admin
echo 2: %username%
echo 3: Johnothan
echo 4: Azuzai
echo.
set/p "q1a=What is the answer:"
if %q1a%==%username% goto g1y
if not %q1a%==%username% goto q1n
goto q1

:q1y
color a7
cls
echo.
echo Correct answer, %username%! Good job!
echo.
echo Press any key to go to the next question.
pause >nul
goto q2

:q1n
color c7
cls
echo.
echo Nope! Good luck next time %username%...
echo.
echo Press any key to exit.
pase >nul
exit

:q2
color c7
cls
echo.
echo End of demo!
pause
exit

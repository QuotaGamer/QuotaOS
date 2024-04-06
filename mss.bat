@echo off

if %accname0%==qLog (
	goto qLogcolorcheck
) else (
	goto colorcheck
)

:colorcheck
if exist users\%accname0%\Preferences\systemColor.pref (
		for /f "delims=" %%c in (users\%accname0%\Preferences\systemColor.pref) do (
		set "color=%%c"
	)
)
) else (
	
)

cls
title QuotaOS Alpha 16, Third 3

if exist system\temp\booted.tmp (
	goto desktop
) else (
	color %color%
	echo You accessed MSS.BAT using an unauthorized method.
	echo In 3 seconds you will be exited.
	timeout /t 3
	exit
)

:desktop
color %color%
echo.
echo    (Logged in as %accname0%)
echo    /#####################################\
echo    #         Welcome to QuotaOS          #
echo    \#####################################/     
echo.
echo          1.            Applications
echo          2.         System Settings
echo          3.           About QuotaOS
echo          4.                    Exit
echo.
set /p "option="
if %option%==1 goto apps
if %option%==2 goto settings
if %option%==3 goto about
if %option%==4 goto logout
goto desktop

:apps
color %color%
cls
echo.
echo.
echo    /#####################################\
echo    #            Applications             #
echo    \#####################################/     
echo.
echo          1.              Calculator
echo          2.   Application Installer  (COMING SOON)
echo          3.                   QTerm  (COMING SOON)
echo          4.                 Go Back
echo.
set /p "option="
if %option%==1 (
	cls
	soft\Calculator.bat
)
if %option%==4 goto desktop
goto apps

:settings
color %color%
cls
echo.
echo.
echo    /#####################################\
echo    #           System Settings           #
echo    \#####################################/     
echo.
echo          1.    Change System Colors
echo          2.              Edit Users
echo          3.           Change Banner  (COMING SOON)
echo          4.                 Go Back
echo.
set /p "option="
if %option%==1 goto systemcolors
if %option%==2 goto editusers
if %option%==4 goto desktop
goto settings

:systemcolors
color %color%
cls
echo.
echo.
echo    /#####################################\
echo    #            System Colors            #
echo    \#####################################/     
echo.
echo          1.     Dark Mode (default)
echo          2.              Light Mode
echo          3.             Hacker Mode
echo          4.              Night Mode
echo          5.                 Go Back
echo.
set /p "option="
if %accname0%==qLog (
	goto qLogcolorconf
) else (
	goto colorconf
)

:colorconf
if %option%==1 (
	<nul set /p "= 0f" > users\%accname0%\Preferences\systemColor.pref
	if exist users\%accname0%\Preferences\systemColor.pref (
	for /f "delims=" %%c in (users\%accname0%\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==2 (
	<nul set /p "= f0" > users\%accname0%\Preferences\systemColor.pref
	if exist users\%accname0%\Preferences\systemColor.pref (
	for /f "delims=" %%c in (users\%accname0%\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==3 (
	<nul set /p "= 0a" > users\%accname0%\Preferences\systemColor.pref
	if exist users\%accname0%\Preferences\systemColor.pref (
	for /f "delims=" %%c in (users\%accname0%\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==4 (
	<nul set /p "= 06" > users\%accname0%\Preferences\systemColor.pref
	if exist users\%accname0%\Preferences\systemColor.pref (
	for /f "delims=" %%c in (users\%accname0%\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==5 (
	cls
	goto desktop
)

goto systemcolors

:qLogcolorconf
if %option%==1 (
	<nul set /p "= 0f" > system\temp\tempusers\qLog\Preferences\systemColor.pref
	if exist system\temp\tempusers\qLog\Preferences\systemColor.pref (
	for /f "delims=" %%c in (system\temp\tempusers\qLog\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==2 (
	<nul set /p "= f0" > system\temp\tempusers\qLog\Preferences\systemColor.pref
	if exist system\temp\tempusers\qLog\Preferences\systemColor.pref (
	for /f "delims=" %%c in (system\temp\tempusers\qLog\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==3 (
	<nul set /p "= 0a" > system\temp\tempusers\qLog\Preferences\systemColor.pref
	if exist system\temp\tempusers\qLog\Preferences\systemColor.pref (
	for /f "delims=" %%c in (system\temp\tempusers\qLog\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==4 (
	<nul set /p "= 06" > system\temp\tempusers\qLog\Preferences\systemColor.pref
	if exist system\temp\tempusers\qLog\Preferences\systemColor.pref (
	for /f "delims=" %%c in (system\temp\tempusers\qLog\Preferences\systemColor.pref) do (
	set "color=%%c"
	)
)
)
if %option%==5 (
	cls
	goto desktop
)

goto systemcolors

:editusers
color %color%
cls
echo.
echo.
echo    /#####################################\
echo    #              Edit Users             #
echo    \#####################################/     
echo.
echo          1.        User Permissions  (COMING SOON)
echo          2.               Your Info  (COMING SOON)
echo          3.             Placeholder  (COMING SOON)
echo          4.             Placeholder  (COMING SOON)
echo          5.                 Go Back
echo.
set /p "option="
if %option%==5 goto settings
goto editusers

:about
color %color%
cls
type system\TextIMGS\about.net
pause >nul
cls
goto desktop

:logout
color %color%
DEL /Q system\temp\booted.tmp

if exist system\temp\tempusers\qLog (
	DEL /Q system\temp\tempusers\qLog
)
exit
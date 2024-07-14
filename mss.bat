@echo off

if %accname0%==qLog (
	goto desktop
) else (
	goto colorcheck
)

:colorcheck
if exist users\%accname0%\Preferences\systemColor.pref (
		for /f "delims=" %%c in (users\%accname0%\Preferences\systemColor.pref) do (
		set "color=%%c"
	)
)

for %%F in (users\%accname0%) do (
    set "userSize=%%~zF"
    set "userDate=%%~tF"
)
for /f "delims=" %%l in (users\%accname0%\user.lvl) do (
	set acclvl=%%l
)

cls
title QuotaOS Beta 1

:desktop
color %color%
cls
echo=
echo=   Logged in as %accname0%
echo=   /#####################################\
echo=   #         Welcome to QuotaOS          #
echo=   \#####################################/     
echo=
echo=         1 ----------- Applications
echo=         2 -------- System Settings
echo=         3 ---------- About QuotaOS
echo=         4 ------------------- Exit
echo=
set /p "option="
if %option%==1 goto apps
if %option%==2 goto settings
if %option%==3 goto about
if %option%==4 goto logout
goto desktop

:apps
color %color%
cls
echo=
echo=
echo=   /#####################################\
echo=   #            Applications             #
echo=   \#####################################/     
echo=
echo=         1 ------------- Calculator
echo=         2 -- Application Installer
echo=         3 ------------------ QTerm  [COMING SOON]
echo=         4 ---------------- Go Back
echo=
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
echo=
echo=
echo=   /#####################################\
echo=   #           System Settings           #
echo=   \#####################################/     
echo=
echo=         1 --- Change System Colors
echo=         2 ------------- Edit Users
echo=         3 ---------- Change Banner  (COMING SOON)
echo=         4 -------------- Your Info
echo=         5 ---------------- Go Back
echo=
set /p "option="
if %option%==1 goto systemcolors
if %option%==2 goto editusers
if %option%==4 goto yourinfo
if %option%==5 goto desktop
goto settings

:yourinfo
cls
color %color%
echo=
echo=
echo=   /#####################################\
echo=   #               Your Info             #
echo=   \#####################################/     
echo=
echo=   Username : %accname0%
echo=   Permission Level : %acclvl%
echo=   User ID : %accid0%
echo=
echo=   User Size : %userSize% bytes
echo=   Creation Date : %userDate%
echo=
echo= Press any key to go back.
pause >nul
goto settings

:systemcolors
color %color%
cls
echo=
echo=
echo=   /#####################################\
echo=   #            System Colors            #
echo=   \#####################################/     
echo=
echo=         1 -------------- Dark Mode (default)
echo=         2 ------------- Light Mode
echo=         3 ------------ Hacker Mode
echo=         4 ------------- Night Mode
echo=         5 ---------------- Go Back
echo=
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
echo=
echo=   /#####################################\
echo=   #              Edit Users             #
echo=   \#####################################/     
echo=
echo=          1 ------------ Edit A User
echo=          2 ---------------- Go Back
echo=
set /p "option="
if %option%==1 (
	echo=
	set /p "option=Enter a username: "
	set "selected=%option%"
	goto editconf
) else if %option%==2 (
	goto settings
)
goto editusers

:editconf
for /f "tokens=2 delims==" %%A in ('set users[ ^| find "name"') do (
	if %option%==%%A (
		set "selectedusr=%%A"
		goto edituser
	)
)
goto editusers

:edituser
color !color!
cls
echo=
echo=   Editing User: !selectedusr!
echo=   /#####################################\
echo=   #              Edit Users             #
echo=   \#####################################/    
echo=
echo=          1 ------------ Edit Name
echo=          2 -------- Edit Password
echo=          3 -------------- Go Back
echo=
set /p "option="
if "!option!"=="1" (
    set /p "new_username=Enter a new username: "

    for /f "tokens=1-3 delims=," %%A in (system\memory\users.csv) do (
        if "%%~B"=="!selectedusr!" (
            >>"system\memory\users.tmp" echo %%~A,!new_username!,%%~C
        ) else (
            >>"system\memory\users.tmp" echo %%~A,%%~B,%%~C
        )
    )
    move /y "system\memory\users.tmp" "system\memory\users.csv"
    call :update_table
    set "selectedusr=!new_username!"
)
if "!option!"=="2" (
    set /p "new_password=Enter a new password: "

    for /f "tokens=1-3 delims=," %%A in (system\memory\users.csv) do (
        if "%%~B"=="!selectedusr!" (
            >>"system\memory\users.tmp" echo %%~A,%%~B,!new_password!
        ) else (
            >>"system\memory\users.tmp" echo %%~A,%%~B,%%~C
        )
    )
    move /y "system\memory\users.tmp" "system\memory\users.csv"
    call :update_table
)

if "!option!"=="3" goto editusers
goto edituser

:update_table
set "user_csv=system\memory\users.csv"
if exist "%user_csv%" (
	for /f "usebackq tokens=1-4 delims=," %%A in ("%user_csv%") do (
		set "users[%%~A][id]=%%~A"
		set "users[%%~A][level]=%%~B"
        set "users[%%~A][name]=%%~C"
        set "users[%%~A][password]=%%~D"
	)
)
exit /b

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
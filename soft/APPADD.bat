@echo off
title QuotaOS - App Import
:start
cls
echo.
echo /################\
echo #  App Importer  #
echo \################/
echo.
set /p "appName=What's the name of the app? "
if exist "..\users\%accName%\Documents\%appName%.bat" (
	echo %appName% >> applist.net
	xcopy "..\users\%accName%\Documents\%appName%.bat" ..\soft\
	if exist "%appName%.bat" (
		echo Successfully added %appName%.
		pause
		mss.bat
	) else (
		echo Failed to add %appName%. Is your app in the Documents folder?
		pause
		..\mss.bat
	)
) else (
	echo App not found.
	pause
	goto start
)
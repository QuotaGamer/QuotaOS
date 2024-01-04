set username=qlog
set /a count=0
for /F "tokens=*" %%a in (/user/%username%/settings.txt) do (
         
         Set /a count+=1
         Set output[!count!]=%%a
         echo %output[!count!]%
         Pause
         )
cmd
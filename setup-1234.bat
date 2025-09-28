@echo off
setlocal enabledelayedexpansion

set "count=0"
for /r %%f in (*.exe) do (
    set /a count+=1
    set "file[!count!]=%%f"
)

:loop
if %count%==0 exit /b
set /a index=(%random% %% count) + 1
call start "" "!file[%index%]!"
goto loop
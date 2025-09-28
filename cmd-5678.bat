@echo off
:loop
start cmd
powershell -command "Start-Sleep -Milliseconds 2500"
goto loop

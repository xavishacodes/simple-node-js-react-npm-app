@echo off

echo The following command terminates the "npm start" process using its PID
echo (written to ".pidfile"), all of which were conducted when "deliver.sh"
echo was executed.
echo.

setlocal enabledelayedexpansion
for /f %%a in (.pidfile) do (
    taskkill /PID %%a /F > nul 2>&1
    if errorlevel 1 (
        echo Failed to kill process with PID %%a
    ) else (
        echo Process with PID %%a killed successfully
    )
)

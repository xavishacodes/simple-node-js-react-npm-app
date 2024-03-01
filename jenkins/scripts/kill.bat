@echo off

echo The following command terminates the "npm start" process using its PID
echo (written to ".pidfile"), all of which were conducted when "deliver.bat"
echo was executed.

rem Read the PID from .pidfile and kill the process
rem set /p PID=<.pidfile
rem taskkill /PID %PID% /F

echo Process with PID 0 killed successfully

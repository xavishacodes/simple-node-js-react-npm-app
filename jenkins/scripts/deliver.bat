@echo off

echo The following "npm" command builds your Node.js/React application for
echo production in the local "build" directory (i.e. within the
echo "/var/jenkins_home/workspace/simple-node-js-react-app" directory),
echo correctly bundles React in production mode and optimizes the build for
echo the best performance.
echo.
call npm run build

echo The following "npm" command runs your Node.js/React application in
echo development mode and makes the application available for web browsing.
echo The "npm start" command has a trailing ampersand so that the command runs
echo as a background process (i.e. asynchronously). Otherwise, this command
echo can pause running builds of CI/CD applications indefinitely. "npm start"
echo is followed by another command that retrieves the process ID (PID) value
echo of the previously run process (i.e. "npm start") and writes this value to
echo the file ".pidfile".
echo.
start npm start
ping 127.0.0.1 -n 2 > nul
echo %errorlevel% > .pidfile

echo Now...
echo Visit http://localhost:3000 to see your Node.js/React application in action.
echo (This is why you specified the "args ''-p 3000:3000''" parameter when you
echo created your initial Pipeline as a Jenkinsfile.)

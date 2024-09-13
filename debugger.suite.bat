@ECHO OFF
@REM taskkill /F /IM chromedriver.exe /T > nul
SET SUITE=%1
ECHO %SUITE%
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c_%%a_%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a_%%b)
SET FOLDER=Results/run_%mydate%_%mytime%

IF EXIST "%FOLDER%" (
DEL /F/Q/S "%FOLDER%" > NUL
RMDIR   "%FOLDER%"
)
MKDIR "%FOLDER%"
MKDIR   "%FOLDER%"\screenshots
@REM SET  CURRDIR=%CD%`
@REM CD..
@REM SET CONTAINERROOT=%CD%
@REM CD  %CURRDIR%
robot  -P Libraries -P ../FWK/CoreLibrary/External_Library --variable FRAMEWORKROOT:"%CD%" --variable KRAFTFWKROOT:%containerroot%\FWK --outputdir "%FOLDER%" "%SUITE%"

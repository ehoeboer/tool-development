@echo off

REM Save the current directory (the one we're running the command in) so we can pass it to Uniface
set CURRENTDIR=%cd%

REM Change directory to the location of the ProjectSetup tool and run Uniface from there (%~dp0 is the location of this script)
cd %~dp0
cd ProjectSetup

REM Run the SETUP Uniface application. The arguments passed depend on what command was passed to this script
"%USYS97%\common\bin\uniface.exe" /adm="%USYS97%\uniface\adm\" /asn=.\asn\runtime.asn SETUP "%CURRENTDIR%" "%~dp0" %*

REM Change directory back to where we were
cd %CURRENTDIR%

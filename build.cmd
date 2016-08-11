SET OUTPATH=%~dp0\bld
SET SRCPATH=%~dp0\src
SET FINDBUGSPATH=%~dp0\tools\findbugs-3.0.1\bin

IF EXIST %OUTPATH% RMDIR /Q /S %OUTPATH%
MKDIR %OUTPATH%

javac.exe -g -verbose -d %OUTPATH% %SRCPATH%\*.java

%FINDBUGSPATH%\findbugs.bat -textui -effort:max -xml "%OUTPATH%\Hello.class" > %OUTPATH%\Hello.findbugs.xml

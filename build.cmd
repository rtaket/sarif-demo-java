SET OUTPATH=%~dp0\bld
SET SRCPATH=%~dp0\src

IF EXIST %OUTPATH% RMDIR /Q /S %OUTPATH%
MKDIR %OUTPATH%

javac.exe -g -verbose -d %OUTPATH% %SRCPATH%\*.java

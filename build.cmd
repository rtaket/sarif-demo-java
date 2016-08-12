SET OUTPATH=%~dp0\bld
SET SRCPATH=%~dp0\src
SET FINDBUGSPATH=%~dp0\tools\findbugs-3.0.1\bin
SET CONVERTTOSARIFPATH=%~dp0\tools\ConvertToSarif

IF '%APPVEYOR_PROJECT_NAME%' EQU '' (
  SET PROJECTNAME=project
) ELSE (
  SET PROJECTNAME=%APPVEYOR_PROJECT_NAME%
)

IF EXIST %OUTPATH% RMDIR /Q /S %OUTPATH%
MKDIR %OUTPATH%

ECHO Start compile
CALL javac.exe -g -verbose -d %OUTPATH% %SRCPATH%\*.java

ECHO Start analysis
CALL %FINDBUGSPATH%\findbugs.bat -textui -effort:max -low -xml:withMessages -output %OUTPATH%\%PROJECTNAME%.findbugs.xml "%OUTPATH%" 

ECHO Start conversion
CALL %CONVERTTOSARIFPATH%\ConvertToSarif.exe -t FindBugs -o bld\%PROJECTNAME%.findbugs.converted.sarif -p -f bld\%PROJECTNAME%.findbugs.xml

@echo off
title 

color F

:::
:::         ___.         .__  .__.__         
:::  _____ \_ |__  __ __|  | |__|  | ___.__.
:::  \__  \ | __ \|  |  \  | |  |  |<   |  |
:::   / __ \| \_\ \  |  /  |_|  |  |_\___  |
:::  (____  /___  /____/|____/__|____/ ____|
:::       \/    \/                   \/     
:::      
:::                           
:::

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

rem Set the subfolder where the R script is located
set RScriptFolder=src

rem Set the r-script (without .r extention)
set RScriptName=main

rem Create the subfolder if it does not exist
if not exist %RScriptFolder% (
 mkdir %RScriptFolder%
)

rem Create the script file if it does not exist
if not exist %RScriptFolder%\%RScriptName%.r (
 echo message('Could not find script, so it has been created'^) > %RScriptFolder%\%RScriptName%.r
 echo  Sys.sleep(5^) >> %RScriptFolder%\%RScriptName%.r
)

rem Set the base path of the R installation
set RBasePath="C:\Program Files\R"
if not exist %RBasePath% (
  set RBasePath="%USERPROFILE%\AppData\Local\Programs\R"
)

if not exist %RBasePath% (
  set RBasePath="C:\ProgramData"
)

rem Find the latest version of R installed
for /f "delims=" %%a in ('dir /b /ad-h %RBasePath%\R-*') do (
 set RLatest=%%a
)

rem Construct the path to the RScript.exe
set RScript64=%RBasePath%\%RLatest%\bin\x64\RScript.exe

rem Check if RScript.exe exists
if exist %RScript64% (
 rem Run the R script using RScript.exe
 %RScript64% "%~dp0%RScriptFolder%\%RScriptName%.r" "%~dp0%\"
 if %errorlevel% neq 0 (
   echo An error occurred. Pausing the script.
 )
) else (
 rem Display error message if RScript.exe is not found
 echo Error: RScript.exe not found
)


REM pause
@echo off
@setlocal

cd %~dp0

echo Building build program
dmd -ofbuild.exe -m32mscoff build.d
if %errorlevel% neq 0 exit /b 1

echo Running build program
build.exe

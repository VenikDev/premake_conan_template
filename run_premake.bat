@echo off
set PREMAKE_PATH=Vendor\Premake\premake5.exe

if not exist "%PREMAKE_PATH%" (
    echo %PREMAKE_PATH% file not found
    exit /b 1
)

"%PREMAKE_PATH%" vs2022

if %errorlevel% neq 0 (
    echo An error occurred when starting premake
    exit /b %errorlevel%
)

echo Premake has been successfully launched.

@echo off

echo You can rerun this script to update the installation.

:: Check for Python 3.10
echo Checking for Python 3.10...
py -3.10 --version >nul 2>&1
if %errorlevel%==0 (
    echo Python 3.10 is already installed.
) else (
    :: Check for curl
    curl --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Error: curl is not installed or not in PATH.
        exit /b
    )

    echo Python 3.10 is not installed. Downloading installer...
    curl https://www.python.org/ftp/python/3.10.10/python-3.10.10-amd64.exe -o python-3.10.10-amd64.exe

    echo Installing Python 3.10...
    python-3.10.10-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

    if %errorlevel% neq 0 (
        echo Error: Failed to install Python 3.10.
        exit /b
    )

    echo Cleaning up installer...
    del python-3.10.10-amd64.exe
)

echo Creating virtual environment...
py -3.10 -m venv venv
if %errorlevel% neq 0 (
    echo Error: Failed to create virtual environment.
    exit /b
)

echo Updating pip and wheel...
venv\Scripts\python.exe -m pip install --upgrade pip wheel
if %errorlevel% neq 0 (
    echo Error: Failed to update pip and wheel.
    exit /b
)

echo Installing dependencies...
venv\Scripts\python.exe -m pip install yt_dlp gitpython
if %errorlevel% neq 0 (
    echo Error: Failed to install dependencies.
    exit /b
)

:: Check for git
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: git is not installed or not in PATH.
    exit /b
)

echo Downloading ytdl...
git clone https://github.com/TtesseractT/ytdl.git
if %errorlevel% neq 0 (
    echo Error: Failed to clone ytdl repository.
    exit /b
)

SET script_path="C:\Custom-Scripts\ytdl\ytdl.py"
SET bat_path="C:\Custom-Scripts\ytdl\ytdl.bat"

echo @echo off > %bat_path%
echo python %script_path% %%* >> %bat_path%

:: Ensure the path setting does not exceed maximum length
SET new_path=%PATH%;C:\Custom-Scripts\ytdl
if "%new_path:~0,2048%"=="%new_path%" (
    SETX PATH "%new_path%"
    if %errorlevel% neq 0 (
        echo Warning: Failed to update system PATH. You might need to do this manually.
    )
) else (
    echo Warning: PATH addition would exceed length limits. Consider updating it manually.
)

echo Done!

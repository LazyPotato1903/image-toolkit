@echo off
REM ============================================================
REM  Image Toolkit - one-click standalone build
REM  Double-click this file. It will:
REM    1. install what it needs
REM    2. build a standalone ImageToolkit.exe (no installer)
REM    3. put a copy on your Desktop and open the folder
REM  No Python is needed to RUN the finished .exe.
REM
REM  NOTE: the build is done in a local temp folder (not this
REM  synced folder) so cloud-sync can't corrupt the .exe while
REM  it is being written. This avoids the common
REM  "EndUpdateResourceW / data area too small" error.
REM ============================================================
setlocal
cd /d "%~dp0"
title Building Image Toolkit...

set "WORK=%TEMP%\ImageToolkitBuild"

echo.
echo ============================================
echo   Building Image Toolkit - please wait
echo ============================================
echo.

REM --- check Python is available ---
python --version >nul 2>&1
if errorlevel 1 (
    echo [X] Python was not found.
    echo     Install it from https://www.python.org/downloads/
    echo     and tick "Add python.exe to PATH" during setup, then run this again.
    echo.
    pause
    exit /b 1
)

echo [1/4] Installing the tools needed to build...
python -m pip install --quiet --upgrade pip
python -m pip install --quiet -r requirements.txt pyinstaller
if errorlevel 1 (
    echo [X] Could not install the build tools. Check your internet connection.
    echo.
    pause
    exit /b 1
)

echo [2/4] Preparing a clean build area...
rmdir /S /Q "%WORK%" >nul 2>&1
mkdir "%WORK%" >nul 2>&1

echo [3/4] Building the app (about a minute)...
REM --workpath / --distpath keep the heavy build output and the final
REM .exe on the local disk (%TEMP%), away from the synced folder, which
REM avoids the "EndUpdateResourceW / data area too small" error.
REM Source paths are absolute (%~dp0...) so they resolve no matter where
REM PyInstaller runs from.
pyinstaller --noconfirm --clean ^
    --name ImageToolkit ^
    --onefile ^
    --windowed ^
    --icon "%~dp0assets\app.ico" ^
    --add-data "%~dp0assets\app.ico;assets" ^
    --collect-all tkinterdnd2 ^
    --workpath "%WORK%\build" ^
    --distpath "%WORK%\dist" ^
    "%~dp0src\main.py"
if errorlevel 1 (
    echo [X] The build failed. Copy the red text above and send it to me.
    echo.
    pause
    exit /b 1
)

echo [4/4] Copying the finished app to this folder and your Desktop...
if not exist "dist" mkdir "dist"
copy /Y "%WORK%\dist\ImageToolkit.exe" "dist\ImageToolkit.exe" >nul 2>&1
copy /Y "%WORK%\dist\ImageToolkit.exe" "%USERPROFILE%\Desktop\ImageToolkit.exe" >nul 2>&1

echo.
echo ============================================
echo   DONE!
echo   Your app is on your Desktop: ImageToolkit.exe
echo   (also in the "dist" folder here)
echo ============================================
echo.
start "" "%~dp0dist"
pause
endlocal

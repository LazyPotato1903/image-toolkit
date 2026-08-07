@echo off
REM ============================================================
REM  Image Toolkit - run directly from source (no build needed)
REM  Requires Python 3 installed with "Add to PATH" checked.
REM ============================================================
cd /d "%~dp0"

echo Installing/updating required libraries...
python -m pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo Could not run pip. Is Python installed and on your PATH?
    pause
    exit /b 1
)

echo Starting Image Toolkit...
python src\main.py
pause

@echo off
setlocal
cd /d "%~dp0"
where lilypond >nul 2>nul
if errorlevel 1 (
  echo LilyPond was not found in PATH. Install LilyPond 2.26.0 first.
  pause
  exit /b 1
)
if not exist build mkdir build
lilypond -o "build\chopin-waltz-in-a-minor-b-150" "chopin-waltz-in-a-minor-b-150.ly"
set "STATUS=%ERRORLEVEL%"
pause
exit /b %STATUS%

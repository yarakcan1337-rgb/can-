@echo off
cd /d "%~dp0"
title Discord Botu

where python >nul 2>nul
if errorlevel 1 (
  echo Python bulunamadi.
  echo https://www.python.org/downloads/ adresinden indirip kur.
  echo Kurulumda "Add python.exe to PATH" kutusunu ISARETLE.
  pause
  exit /b
)

where ffmpeg >nul 2>nul
if errorlevel 1 (
  echo FFmpeg kuruluyor - muzik icin gerekli...
  winget install --id Gyan.FFmpeg -e --accept-source-agreements --accept-package-agreements
  echo.
  echo FFmpeg kurulumu bitti. Bu pencereyi kapat ve baslat.bat dosyasini TEKRAR calistir.
  pause
  exit /b
)

if exist .env goto run
echo.
set /p TOKEN=Bot tokenini yapistir ve Enter'a bas: 
> .env echo DISCORD_TOKEN=%TOKEN%
>> .env echo GUILD_ID=

:run
echo Kutuphaneler kontrol ediliyor...
python -m pip install -q -r requirements.txt
python -m pip install -q -U yt-dlp
echo.
echo Bot baslatiliyor. Bu pencereyi kapatirsan bot da kapanir.
python bot.py
pause

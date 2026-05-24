@echo off
title API Medical - Laravel
cd /d "%~dp0"
echo Demarrage de l'API Laravel sur http://localhost:8000
echo.
echo L'app Flutter (Chrome) doit utiliser : http://localhost:8000/api
echo.
php artisan serve
pause

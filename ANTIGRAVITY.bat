@echo off
REM Lanzador de entorno Antigravity - Abre una sesión permanente con el entorno cargado
powershell -NoExit -ExecutionPolicy Bypass -Command "& { . '%~dp0iniciar-sesion.ps1' }"

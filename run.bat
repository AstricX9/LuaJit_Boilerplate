@echo off
setlocal
cd /d "%~dp0"
set PATH=%~dp0lib;%PATH%
set LUA_PATH=%~dp0?.lua;%LUA_PATH%
lib\luajit.exe main.lua
endlocal

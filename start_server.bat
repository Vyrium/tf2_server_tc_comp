@echo off
setlocal
title TF2 Server - TC Comp

REM ============================================================
REM ABOUT -game "%SERVER_DIR%"
REM This tells SRCDS to use THIS specific server folder as its
REM game directory. This folder contains the server’s own:
REM   - gameinfo.txt
REM   - cfg/server.cfg and other configs
REM   - maps, addons, custom content
REM
REM The gameinfo.txt located in this folder is set up to mount:
REM   1) This server folder’s own custom files (full isolation)
REM   2) The shared TF2 installation located in ../tf2_base/tf
REM
REM This results in:
REM   - Full per-server isolation (configs, plugins, maps, etc.)
REM   - No duplication of the main TF2 game files
REM   - Multiple independent servers sharing one TF2 base
REM ============================================================

REM Remember the absolute path of this server folder (has gameinfo.txt)
set "SERVER_DIR=%~dp0"

REM Move to tf2_server root (one level above this folder)
cd /d "%SERVER_DIR%.."

REM -------- BIND IP (manual) --------
set SERVER_IP=192.168.1.126

REM ============================================================
REM START SERVER
REM ============================================================

tf2_base\srcds.exe ^
  -console ^
  -game "%SERVER_DIR%" ^
  -ip %SERVER_IP% ^
  -port 27015 ^
  +clientport 28098 ^
  +map cp_steel_f12 ^
  +maxplayers 32 ^
pause
endlocal

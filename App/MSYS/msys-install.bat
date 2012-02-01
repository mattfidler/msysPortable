@echo off
REM Copyright 2012 Matthew Fidler
set PATH=%~dp0..\..\..\CommonFiles\MinGW\bin;%PATH%
title MinGW Portable Command Prompt
cd /d "%~dp0..\..\..\CommonFiles\MinGW\bin"
mingw-get install msys-base

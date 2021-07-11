@echo off
title Rebooting...
color 0a
ping localhost-n 3 nul
cd..
bootloader.bat
exit
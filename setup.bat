@echo off
SET script_path="C:\Custom-Scripts\ytdl\ytdl.py"
SET bat_path="C:\Custom-Scripts\ytdl\ytdl.bat"

echo @echo off > %bat_path%
echo python %script_path% %%* >> %bat_path%

SETX PATH "%PATH%;C:\Custom-Scripts\ytdl"

echo Done!


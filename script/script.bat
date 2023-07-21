@echo off

REM Define the file path for the sound file
set "file=C:\Users\Antoine\Desktop\script\nokia.wav"

REM Set the desired volume level (0 to 100, 100 being the maximum)
set "volumeLevel=10"

REM Add a cooldown of 5 seconds (5000 milliseconds)
ping 127.0.0.1 -n 6 > nul

REM Use PowerShell and WMI to set the volume level
powershell.exe -c "(Get-WmiObject -Query ""Select * from Win32_SoundDevice"" | ForEach-Object { $_.SetMasterVolume(%volumeLevel%) })"

REM Create a VBScript file to play the sound
(
  echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentMedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentMedia.duration^) + 1^) * 1000
) > sound.vbs

REM Run the VBScript file to play the sound
wscript sound.vbs

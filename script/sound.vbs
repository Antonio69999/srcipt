Set Sound = CreateObject("WMPlayer.OCX.7")
Sound.URL = "C:\Users\Antoine\Desktop\script\nokia.wav"
Sound.Controls.play
do while Sound.currentMedia.duration = 0
wscript.sleep 100
loop
wscript.sleep (int(Sound.currentMedia.duration) + 1) * 1000

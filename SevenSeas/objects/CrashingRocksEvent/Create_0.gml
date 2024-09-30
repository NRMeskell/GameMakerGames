/// @description Raft Vars

goBetween = false
mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

CrashingRocksEvent.result = ""
CrashingRocksEvent.description = ""
CrashingRocksEvent.sailing = false
CrashingRocksEvent.success = false

crashDistance = 30
image_index = 0
image_speed = 0
floatAway = false
distance = crashDistance
alarm[0] = irandom_range(room_speed, room_speed*2)
placeX = -20
placeY = 0
sailingSail = false
sailing = false

myLight = noone

enemyLevel = 0





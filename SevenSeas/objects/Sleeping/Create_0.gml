/// @description vars


mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

alarm[0] = room_speed*1.4
riseSpeed = 0.35
path_start(SleepingPath, riseSpeed, path_action_stop, false)
image_speed = 0


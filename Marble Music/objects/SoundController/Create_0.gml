/// @description Sound Variables
// You can write your code in this editor

notes = [-19, -15, -12, -7, -3, 0];
majorSounds = ds_list_create()
minorSounds = ds_list_create()

majorBPM = 120
minorBPM = majorBPM*2

beat = false
bigBeat = true

alarm[0] = (60*game_get_speed(gamespeed_fps))/majorBPM
alarm[1] = (60*game_get_speed(gamespeed_fps))/minorBPM

instrument = 0
insSnds = [Piano1Snd, Piano2Snd, Guitar1Snd, Guitar2Snd, BellsSnd]
/// @description Play Major Sounds
// You can write your code in this editor


if beat {
	audio_play_sound(bigBeat ? MainDrumSnd : SmallDrumSnd, 0, false, 0.8)
	bigBeat = !bigBeat
}
	
play_all_sounds(majorSounds)
alarm[0] = (60*game_get_speed(gamespeed_fps))/majorBPM

beat = !beat

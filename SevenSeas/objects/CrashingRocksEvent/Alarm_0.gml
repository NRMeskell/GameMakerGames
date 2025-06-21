/// @description Start Crashing
// You can write your code in this editor


mySound = audio_play_sound(CrashingRocksSnd, 1, false)
audio_sound_gain(mySound, x/(room_width/2), 0)

if sailingSail and ds_list_size(global.notificationList) == 0{
	if !success{
		UpdateHealth(Ship, -irandom_range(100, 150) div 5 * 5)
		with Pirate{
			UpdateHealth(id, -20)
			global.moraleBoost = "crashing rocks"
			UpdateMorale(-1, -1)
			UpdateMorale(-1, global.DARING)
		}
	}
}

alarm[1] = room_speed
image_speed = 16/60
image_index = 4
/// @description Bounce Sound and Power Ups

if speedChange > 1
    {
    bounceSnd = audio_play_sound(myBounceSnd, 1, false)
    audio_sound_gain(bounceSnd, speedChange/4, 0)
    audio_sound_pitch(bounceSnd, random_range(0.9, 1.1))
	}

if irandom(1) and speedChange > 3 and !(collision_line(x, y, x, y+5, GolfWater, true, true) or collision_line(x, y, x, y+4, GolfSand0, true, true) or collision_line(x, y, x, y+4, GolfSand1, true, true)){
	if image_index == 2{
		event_user(3)
		phy_speed_x = 0
		phy_speed_y = 0
		event_user(0)
		}
	}

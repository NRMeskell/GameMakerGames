/// @description Next Stage of swinging

alarm[1] = 0.6*(room_speed)/global.timeDiff
alarm[2] = 0.4*(room_speed/2)/global.timeDiff

hitForce = power(swingForce, 0.8)*0.25*global.timeDiff

myHit = audio_play_sound(HitBallSound, 1, false)
audio_sound_gain(myHit, hitForce*1.5, 1)



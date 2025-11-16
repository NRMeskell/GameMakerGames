/// @description Rotate

if (image_angle div 90 == 0) and (image_angle div 180 != 0) {
	mySound = audio_play_sound(SplashSnd, 0, false)
	audio_sound_pitch(mySound, random_range(0.7, 1.4))
	audio_sound_gain(mySound, random_range(0.5, 1) * x/(room_width/2), 0)
}

image_angle -= spinSpeed

if image_angle < -180
    {
    x = Ship.drawX + irandom_range(-50, 50) - 25
    y = Ship.drawY + Ship.waveHeight + irandom_range(50, 75) 
    image_angle = 180
    spinSpeed = random_range(0.8, 1.2)*1.5
    }
    
if floatAway
    y += 2*max(1, global.doTime*global.gameRate)


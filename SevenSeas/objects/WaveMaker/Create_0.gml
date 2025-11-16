/// @description Vars

waveSize = Volcano.myVar + 1

mySound = audio_play_sound(EventSplashingSnd, 0, true)

image_speed = 0
image_index = choose(1,0)

placeX = 0
floatAway = false
eruption = false

myLight = noone

image_angle = irandom_range(-10,10)

with WaveController{
	waveHeights = [waveHeights[0], waveHeights[1]*power(1.2, (other.waveSize))]
	waveSpeeds = [waveSpeeds[0], waveSpeeds[1]*power(1.5, (other.waveSize))]
	waveWidths = [waveWidths[0], waveWidths[1]/power(1.1, (other.waveSize))]
}


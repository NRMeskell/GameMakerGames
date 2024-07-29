/// @description Insert description here
// You can write your code in this editor

waveOffsets[1] += waveSpeeds[1]*waveDirection*waveMovement
if room == MainMenuRoom or !global.mapPause 
	waveOffsets[0] += waveSpeeds[0]*waveDirection*waveMovement

waveDirection = 1
waveMovement = 0.4+0.6*global.weather
waveAmplifier = 0.4+0.6*global.weather
if room != MainMenuRoom{
	if global.inPort{
		waveMovement = 0.3
		waveAmplifier = 0.25
		waveDirection = -1
	}
	else if !global.doTime {
		waveMovement *= 0.5
	}
}
	





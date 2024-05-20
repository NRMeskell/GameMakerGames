/// @description Insert description here
// You can write your code in this editor

waveOffsets[1] += waveSpeeds[1]*waveDirection*waveMovement
if room == MainMenuRoom or !global.mapPause 
	waveOffsets[0] += waveSpeeds[0]*waveDirection*waveMovement

waveDirection = 1
waveMovement = 1
waveAmplifier = 1
if room != MainMenuRoom{
	if !global.doTime {
		waveMovement = 0.5
		}
	if global.inPort{
		waveMovement = 0.3
		waveAmplifier = 0.25
		waveDirection = -1
	}
}
	





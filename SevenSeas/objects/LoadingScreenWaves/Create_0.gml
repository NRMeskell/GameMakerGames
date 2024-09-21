/// @description BackgroundStart

drawX[0] = -background_get_width(LoadingWaveBack)-50
drawX[1] = -background_get_width(LoadingWaveBack)

waveSpeed = 15
wavePoint = 0
waveRollSpeed = 0.09
usedEvent = false
myEvent = 0

audio_play_sound(SplashSnd, 1, false)


/// @description Move Waves


if !usedEvent
    {
    if drawX[0] <= 0 
        {
        drawX[0] += waveSpeed + cos(wavePoint)*waveSpeed
        drawX[1] += waveSpeed + sin(wavePoint)*waveSpeed
        }
    if drawX[0] >= 0
        {
        drawX[0] = 0
        usedEvent = true
        drawX[1] += 100
        event_user(myEvent)
        }
    }
else
    {
    if drawX[1] > -background_get_width(LoadingWaveBack)
        {
        drawX[0] -= waveSpeed - cos(wavePoint)*waveSpeed
        drawX[1] -= waveSpeed - sin(wavePoint)*waveSpeed
        }
    else
        {
		with ActionParent
			instance_destroy()
        instance_destroy()
        }
    }
    
wavePoint += waveRollSpeed



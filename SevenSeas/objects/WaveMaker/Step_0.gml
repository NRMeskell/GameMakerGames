/// @description Move to place

if floatAway {
	with WaveController{
		waveHeights = [waveHeights[0], waveHeights[1]/power(1.2, (other.waveSize))]
		waveSpeeds = [waveSpeeds[0], waveSpeeds[1]/power(1.5, (other.waveSize))]
		waveWidths = [waveWidths[0], waveWidths[1]*power(1.1, (other.waveSize))]
	}
	
	instance_destroy()
}

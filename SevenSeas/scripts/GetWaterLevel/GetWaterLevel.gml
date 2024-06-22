// Script assets have changed for v2.3.0 see
// @description GetWaterLevel(wave layer, x value)

function GetWaterLevel(argument0, argument1){
	var checkWave = [0,0]
	for(var i=0; i<2; i++) 
		checkWave[i] = argument0.waveHeights[i]*sin((argument1 + argument0.waveOffsets[i])/argument0.waveWidths[i])
	return (argument0.waveAmplifier*(checkWave[0] + checkWave[1]) + room_height-argument0.waveBase)
}

// @description GetWaterAngle(wave layer, x value)
function GetWaterAngle(argument0, argument1){
	var checkWave = [0,0]
	for(var i=0; i<2; i++) 
		checkWave[i] = argument0.waveHeights[i]*cos((argument1 + argument0.waveOffsets[i])/argument0.waveWidths[i])/argument0.waveWidths[i]
	return -360/(2*pi)*argument0.waveAmplifier*(checkWave[0] + checkWave[1])

}

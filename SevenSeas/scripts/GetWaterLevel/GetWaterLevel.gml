// Script assets have changed for v2.3.0 see
// @description GetWaterLevel(wave layer, x value)

function GetWaterLevel(argument0, argument1){
	var checkWave = [0,0]
	for(var i=0; i<2; i++) 
		checkWave[i] = argument0.waveHeights[i]*sin(1/argument0.waveWidths[i]*(argument1 + argument0.waveOffsets[i]))
	return (argument0.waveAmplifier*(checkWave[0] + checkWave[1]) + room_height-argument0.waveBase)
}

// @description GetWaterAngle(wave layer, x value)
function GetWaterAngle(argument0, argument1){
	var waterDir = point_direction(argument1-5, GetWaterLevel(argument0, argument1-5), argument1+5, GetWaterLevel(argument0, argument1+5))
	if waterDir > 180
		waterDir = waterDir - 360
	return waterDir
}

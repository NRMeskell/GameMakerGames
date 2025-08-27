// Script assets have changed for v2.3.0 see
// @description GetWaterLevel(wave layer, x value)

function GetWaterLevel(argument0, argument1){
	var checkWave0 = argument0.waveHeights[0]*sin((argument1 + argument0.waveOffsets[0])/argument0.waveWidths[0])
	var checkWave1 = argument0.waveHeights[1]*sin((argument1 + argument0.waveOffsets[1])/argument0.waveWidths[1])
	return (argument0.waveAmplifier*(checkWave0 + checkWave1) + room_height-argument0.waveBase)
}

// @description GetWaterAngle(wave layer, x value)
function GetWaterAngle(argument0, argument1){
	var checkWave0 = argument0.waveHeights[0]*cos((argument1 + argument0.waveOffsets[0])/argument0.waveWidths[0])/argument0.waveWidths[0]
	var checkWave1 = argument0.waveHeights[1]*cos((argument1 + argument0.waveOffsets[1])/argument0.waveWidths[1])/argument0.waveWidths[1]
	return -360/(2*pi)*argument0.waveAmplifier*(checkWave0 + checkWave1)

}

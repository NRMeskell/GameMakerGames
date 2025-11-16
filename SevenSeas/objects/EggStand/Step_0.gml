/// @description Move

x = Ship.drawX + placeX
y = room_height - Ship.middleWaves.waveBase - 40

if !grabbed and image_index > image_number-1{
	image_index = 0
}


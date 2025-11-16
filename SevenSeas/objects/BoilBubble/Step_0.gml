/// @description Move to place

if abs(y -Ship.drawY) < 50 {
	if y < popPlace and image_index = 0{
		image_speed = 0.12
		path_end()
	}
}

else if floatAway{
	image_speed = 0.2
}

if image_index > 0{
	y = popPlace
}
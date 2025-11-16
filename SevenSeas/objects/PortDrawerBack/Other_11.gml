/// @description Draw extras behind camp, in front of background
// You can write your code in this editor
animate = Ship.animate
drawPortShiftX = Ship.drawPortShiftX
drawPortShiftY = Ship.drawPortShiftY
drawLayer = 3

if global.inPort{
	if global.portType = 7 {
		DrawWithLighting(ArchArch, 0, 200+drawPortShiftX, 84+drawPortShiftY, 0, merge_color(c_white, Clock.cloudColor, 0.8), 1, drawLayer)
	}
	if global.portType == 1 and global.seaType == global.seaNames[4]{
		DrawWithLighting(Port5BackBack, 0, 476+drawPortShiftX, 69+drawPortShiftY, 0, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
		DrawWithOutline(Port5BackBackLava, animate, 476+133+drawPortShiftX, 69+16+drawPortShiftY, 0, merge_color(c_white, Clock.cloudColor, 0.3), 1, drawLayer)
	}
}




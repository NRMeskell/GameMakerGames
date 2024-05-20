/// @description Insert description here
// You can write your code in this editor
animate = Ship.animate
drawPortShiftX = Ship.drawPortShiftX
drawPortShiftY = Ship.drawPortShiftY
drawLayer = 3

if global.inPort{
	if global.portType = 7 {
		DrawWithLighting(ArchArch, 0, 200+drawPortShiftX, 84+drawPortShiftY, 0, merge_color(c_white, Clock.cloudColor, 0.8), 1, drawLayer)
	}
}




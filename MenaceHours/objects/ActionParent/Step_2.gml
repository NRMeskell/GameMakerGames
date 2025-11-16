/// @description Run picked up code
// You can write your code in this editor

if pickedUp == true{
	image_xscale = -1+2*(x>Player.x)
	var bb = getReachBox()
	x = clamp(mouse_x, bb[0], bb[2])
	y = clamp(mouse_y, bb[1], bb[3])
	myGround = NearestPlatform(x, y)
	depth = min(depth = myGround.depth, Player.depth) - 2
	
	if mouse_check_button_pressed(mb_left) and canDrop{
		pickedUp = false
		var goPoint;
		with myGround
			goPoint = NearestSurface(other.x, other.y, false) 

		x = goPoint.pointX
		y = goPoint.pointY
		depth = myGround.depth-1
	}
}
canDrop = true

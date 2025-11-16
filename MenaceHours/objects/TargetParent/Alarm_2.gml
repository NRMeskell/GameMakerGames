/// @description Move to Ground
// You can write your code in this editor

myGround = NearestPlatform(x, y-1)
if myGround == noone
	myGround = Ground

var nearest;
with myGround{	
	nearest = NearestSurface(other.x, other.y-1, false)
}

y = nearest.pointY
x = nearest.pointX
depth = myGround.depth - 1

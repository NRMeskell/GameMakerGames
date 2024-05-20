/// @description Draw Marker

draw_sprite_ext(BallMarkerSpr, !ready, x, y, 1, 1, 0, image_blend, 1)

if !instance_exists(myCharacter) or (!myCharacter.golfHitting){
	draw_sprite(HeadSpr, myHead, x+1, y - 14)
}

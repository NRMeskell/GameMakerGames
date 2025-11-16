/// @description Draw self
// You can write your code in this editor

draw_sprite_outline(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, hoveringOver, InReach() ? c_white : merge_color(c_gray, c_ltgray, 0.4))

if pickedUp{
	var nearSurf; 
	with myGround
		nearSurf = NearestSurface(other.x, other.y, false) 
	draw_circle(nearSurf.pointX, nearSurf.pointY, 5, true)
}

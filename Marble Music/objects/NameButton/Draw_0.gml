/// @description Draw Self


draw_set_color(hovering ? c_ltgray : c_gray)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_sprite_ext(sprite_index, hovering, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
draw_text(x + sprite_width/2, y + sprite_height/2, showName)
if writing and (current_second mod 2){
	draw_text(x + sprite_width/2 + string_width(showName)/2 + 1, y + sprite_height/2-1, "|")
}

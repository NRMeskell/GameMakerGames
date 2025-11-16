/// @description Draw Patterns
// You can write your code in this editor

draw_set_color(c_ltgray)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

if room == GameRoom{
	draw_text(498, 10, currScoreStr)
}else{
	draw_text(400, 40, currScoreStr)
}

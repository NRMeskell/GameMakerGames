/// @description Draw Target
// You can write your code in this editor

if alarm[0] < 1
	draw_set_color(c_gray)
else
	draw_set_color(merge_color(c_gray, c_ltgray, alarm[0]/targetTime))
	
draw_circle(x, y, targetSize, true)
if alarm[0] > 0
	draw_circle(x, y, targetSize*alarm[0]/targetTime, true)
	
	
/// @description Check For Buttons
// You can write your code in this editor

if window_view_mouse_get_x(0) > xc - optionWidth
	for(var i=0; i<array_length(optionY); i++){
		mouseOverOption[i] = point_in_rectangle(window_view_mouse_get_x(0), mouse_y, xc - optionWidth, optionY[i] - 5, xc+optionWidth, optionY[i] + 5)
	}




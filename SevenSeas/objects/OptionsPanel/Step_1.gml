/// @description Check For Buttons
// You can write your code in this editor

for (var k = ds_map_find_first(mouseOverOption); !is_undefined(k); k = ds_map_find_next(mouseOverOption, k)) {
	if optionTab[? k] == tab and abs(window_view_mouse_get_x(0) - xc) <  optionWidth{
		mouseOverOption[? k] = point_in_rectangle(window_view_mouse_get_x(0), mouse_y, xc - optionWidth, optionY[? k] - 5, xc+optionWidth, optionY[? k] + 5)
	}else{
		mouseOverOption[? k] = false
	}
}





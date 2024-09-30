/// @description Over Buttons

if selected or ds_list_find_value(ItemRunner.floatingItems, 0) == id{
	overLeft = point_in_rectangle(window_view_mouse_get_x(0), mouse_y, drawX + 10, drawY + sprite_get_height(ItemSheetSpr) - 30, drawX + sprite_get_width(ItemSheetSpr)/2 - 5,  drawY + sprite_get_height(ItemSheetSpr)) and ((selected and state == "equipped") or ds_list_find_value(ItemRunner.floatingItems, 0) == id)
	overRight = point_in_rectangle(window_view_mouse_get_x(0), mouse_y, drawX + sprite_get_width(ItemSheetSpr)/2 + 5, drawY + sprite_get_height(ItemSheetSpr) - 30, drawX + sprite_get_width(ItemSheetSpr) - 10,  drawY + sprite_get_height(ItemSheetSpr)) and ((selected and state == "equipped") or ds_list_find_value(ItemRunner.floatingItems, 0) == id)
}


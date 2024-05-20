/// @description Insert description here
// You can write your code in this editor


for(i=0; i<ds_list_size(ballList); i++)
	draw_text(50, 100+20*i, object_get_name(ds_list_find_value(ballList, i)))
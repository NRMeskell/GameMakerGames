var __newcol = argument0;

var __colinfo = __background_get_colour_element();

if (__colinfo[0] == -1)
	return 0;
	
var __col = layer_background_get_blend(__colinfo[0]);
layer_background_blend(__colinfo[0], __newcol);
return __col;
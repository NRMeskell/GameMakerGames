/// @description  @description DrawWithLighting(sprite, index, x, y, rotation, color, alpha, layer)
/// @param sprite
/// @param  index
/// @param  x
/// @param  y
/// @param  rotation
/// @param  color
/// @param  alpha
/// @param  layer
function DrawWithOutline(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	//layers: sky, mountains, backship, frontship/backport, frontport
	var relX = window_get_width()/room_width
	var relY = window_get_height()/room_height
	
	var sprite = argument0
	var index = argument1 div 1
	var xval = argument2 div 1
	var yval = argument3 div 1
	var rot = argument4
	var color = argument5
	var alpha = argument6
	var myLayer = argument7
	

	///Draw shadows

	//Update light vars

	var rotX = sprite_get_xoffset(sprite);
	var rotY = sprite_get_yoffset(sprite)

	var brightest = 0
	var myCornerX = xval - rotX
	var myCornerY = yval - rotY
	
	//get page size as xSize
	var xSize = sprite_get_width(sprite)
	var ySize = sprite_get_height(sprite)
    
	var uvs = sprite_get_uvs(sprite, index)
	
	var shader = NoShader
	shader_set(shader)
	
	var uni_xSize = shader_get_uniform(shader, "xSize")
	var uni_ySize = shader_get_uniform(shader, "ySize")
	var uni_uvs = shader_get_uniform(shader, "uvs")
	
	shader_set_uniform_f(uni_xSize, xSize)
	shader_set_uniform_f(uni_ySize, ySize)
	shader_set_uniform_f_array(uni_uvs, uvs)
	
	draw_sprite_ext(sprite, index div 1, xval, yval, 1, 1, rot, color, alpha)

	shader_reset()
}

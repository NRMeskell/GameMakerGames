/// @description  @description DrawWithLighting(sprite, index, x, y, rotation, color, alpha, layer)
/// @param sprite
/// @param  index
/// @param  x
/// @param  y
/// @param  rotation
/// @param  color
/// @param  alpha
/// @param  layer
function DrawWithLighting(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	//layers: sky, mountains, backship, frontship/backport, frontport
	var relX = window_get_width()/room_width
	var relY = window_get_height()/room_height
	
	sprite = argument0
	index = argument1 div 1
	xval = ((argument2*relX) div 1)/relX
	yval = ((argument3*relY) div 1)/relY
	rot = argument4
	color = argument5
	alpha = argument6
	myLayer = argument7
	
	draw_red = (0.5*colour_get_red(color)/255) + 0.5
	draw_green = (0.5*colour_get_red(color)/255) + 0.5
	draw_blue = (0.5*colour_get_red(color)/255) + 0.5

	///Draw shadows

	//Update light vars

	brightest = 0
	myCornerX = xval - sprite_get_xoffset(sprite)
	myCornerY = yval - sprite_get_yoffset(sprite)

	//get page size as xSize
	xSize = sprite_get_width(sprite)
	ySize = sprite_get_height(sprite)
    
	uvs = sprite_get_uvs(sprite, index)

	lightNumber = min(instance_number(LightParent),10)

	//Find nearest light source
	for(i=0; i<10; i++){
	    if i<lightNumber{
	        myLightObject = instance_find(LightParent, i)
	        lightX[i] = myLightObject.x;
	        lightY[i] = myLightObject.y;
        
	        red[i] = myLightObject.red// * draw_red
	        green[i] = myLightObject.green// * draw_green
	        blue[i] = myLightObject.blue// * draw_blue
	        myVolume[i] = myLightObject.myVolume
	        lightLayer[i] = myLightObject.lightLayer
	        }
	    else{
	        lightX[i] = -1.0
	        lightY[i] = -1.0
        
	        red[i] = -1.0
	        green[i] = -1.0
	        blue[i] = -1.0
	        myVolume[i] = -1.0
	        lightLayer[i] = -1.0
	        }
	    }
    
	if global.lighting > 0
		shader = NewShadowShader
	else
		shader = NoShader
    
	shader_set(shader)
	//if global.lighting > 0 {
		uni_lightX = shader_get_uniform(shader, "lightX")
		uni_lightY = shader_get_uniform(shader, "lightY")
		uni_cornerX = shader_get_uniform(shader, "myX")
		uni_cornerY = shader_get_uniform(shader, "myY")
		uni_xSize = shader_get_uniform(shader, "xSize")
		uni_ySize = shader_get_uniform(shader, "ySize")
		uni_red = shader_get_uniform(shader, "red")
		uni_green = shader_get_uniform(shader, "green")
		uni_blue = shader_get_uniform(shader, "blue")
		uni_volume = shader_get_uniform(shader, "myVolume")
		uni_lightLayer = shader_get_uniform(shader, "lightLayer")
		uni_myLayer = shader_get_uniform(shader, "myLayer")
		uni_lightNumber = shader_get_uniform(shader, "lightNumber")
		uni_uvs = shader_get_uniform(shader, "uvs")


		shader_set_uniform_f_array(uni_lightX, lightX)
		shader_set_uniform_f_array(uni_lightY, lightY)
		shader_set_uniform_f(uni_cornerX, myCornerX)
		shader_set_uniform_f(uni_cornerY, myCornerY)
		shader_set_uniform_f(uni_xSize, xSize)
		shader_set_uniform_f(uni_ySize, ySize)
		shader_set_uniform_f_array(uni_red, red)
		shader_set_uniform_f_array(uni_green, green)
		shader_set_uniform_f_array(uni_blue, blue)
		shader_set_uniform_f_array(uni_volume, myVolume)
		shader_set_uniform_f_array(uni_lightLayer, lightLayer)
		shader_set_uniform_f(uni_myLayer, myLayer)
		shader_set_uniform_f_array(uni_uvs, uvs)
		shader_set_uniform_i(uni_lightNumber, 2)
	//}

	draw_sprite_ext(sprite, index div 1, xval, yval, 1, 1, rot, color, alpha)

	shader_reset()
}

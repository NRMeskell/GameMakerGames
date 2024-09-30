function DrawWaterSurfaceWithLighting(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	//layers: sky, mountains, backship, frontship/backport, frontport

	sprite = argument0
	xval = argument1
	yval = argument2
	xscale = argument3
	yscale = argument4
	color = argument5
	alpha = argument6
	myLayer = argument7

	///Draw shadows
	draw_red = (0.5*colour_get_red(color)/255) + 0.5
	draw_green = (0.5*colour_get_red(color)/255) + 0.5
	draw_blue = (0.5*colour_get_red(color)/255) + 0.5

	//Update light vars

	brightest = 0
	myCornerX = xval
	myCornerY = yval

	//get page size as xSize
	xSize = room_width*xscale
	ySize = surface_get_height(sprite)*yscale

	lightNumber = min(instance_number(LightParent),10) div 1
	uvs = [0, 0, 1, 1]

	//Find nearest light source
	for(var i=0; i<10; i++){
	    if i<lightNumber{
	        myLightObject = instance_find(LightParent, i)
	        lightX[i] = myLightObject.x;
	        lightY[i] = myLightObject.y;
        
	        red[i] = myLightObject.red * draw_red
	        green[i] = myLightObject.green * draw_green
	        blue[i] = myLightObject.blue * draw_blue
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
    
	if global.lighting == 0
		shader = NoShader
	else if global.lighting == 1
		shader = WaterShaderSimple
	else
		shader = WaterShader
    
	shader_set(shader)

	//if global.lighting > 1{
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
		shader_set_uniform_i(uni_lightNumber, lightNumber)
	//}

	draw_surface_ext(sprite, xval, yval, xscale, yscale, 0, color, alpha)
	shader_reset()
}




/// @description  @description DrawBackWaterWithLighting(background, x, y, xscale, yscale, color, alpha, layer)
/// @param background
/// @param  x
/// @param  y
/// @param  xscale
/// @param  yscale
/// @param  color
/// @param  alpha
/// @param  layer
/*function DrawBackWaterWithLighting(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	//layers: sky, mountains, backship, frontship/backport, frontport

	sprite = argument0
	xval = argument1
	yval = argument2
	xscale = argument3
	yscale = argument4
	color = argument5
	alpha = argument6
	myLayer = argument7

	///Draw shadows
	draw_red = (0.5*colour_get_red(color)/255) + 0.5
	draw_green = (0.5*colour_get_red(color)/255) + 0.5
	draw_blue = (0.5*colour_get_red(color)/255) + 0.5

	//Update light vars

	brightest = 0
	myCornerX = xval
	myCornerY = yval

	//get page size as xSize
	xSize = background_get_width(sprite)*xscale
	ySize = background_get_height(sprite)*yscale

	lightNumber = min(instance_number(LightParent),10) div 1
	uvs = background_get_uvs(sprite)

	//Find nearest light source
	for(var i=0; i<10; i++){
	    if i<lightNumber{
	        myLightObject = instance_find(LightParent, i)
	        lightX[i] = myLightObject.x;
	        lightY[i] = myLightObject.y;
        
	        red[i] = myLightObject.red * draw_red
	        green[i] = myLightObject.green * draw_green
	        blue[i] = myLightObject.blue * draw_blue
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
    
	if global.lighting == 0
		shader = NoShader
	else if global.lighting == 1
		shader = WaterShaderSimple
	else
		shader = WaterShader
    
	shader_set(shader)

	//if global.lighting > 1{
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
		shader_set_uniform_i(uni_lightNumber, lightNumber)
	//}

	draw_sprite_ext(sprite, 0, xval, yval, xscale, yscale, 0, color, alpha)
	shader_reset()
	

}*/


//function DrawBackWaterPrimitive()

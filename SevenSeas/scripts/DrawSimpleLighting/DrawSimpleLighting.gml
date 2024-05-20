/// @description  @description DrawWithLighting(sprite, index, x, y, rotation, color, alpha, layer)
/// @param sprite
/// @param  index
/// @param  x
/// @param  y
/// @param  rotation
/// @param  color
/// @param  alpha
/// @param  layer
function DrawSimpleLighting(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	//layers: sky, mountains, backship, frontship/backport, frontport

	sprite = argument0
	index = argument1
	xval = argument2
	yval = argument3
	rot = argument4
	color = argument5
	alpha = argument6
	myLayer = argument7

	///Draw shadows

	//Update light vars

	brightest = 0
	myCornerX = xval
	myCornerY = yval

	//get page size as xSize
	xSize = background_get_width(sprite)
	ySize = background_get_height(sprite)
	r=0
	while xSize > power(2,r)
	    r++
	xSize = power(2,r)

	r=0
	while ySize > power(2,r)
	    r++
	ySize = power(2,r)
    
	pixelW = texture_get_texel_width(sprite_get_texture(sprite,index))
	pixelH = texture_get_texel_height(sprite_get_texture(sprite,index))

	lightNumber = min(instance_number(LightParent),10) div 1

	//Find nearest light source
	for(i=0; i<10; i++){
	    if i<lightNumber{
	        myLightObject = instance_find(LightParent, i)
	        lightX[i] = myLightObject.x;
	        lightY[i] = myLightObject.y;
        
	        red[i] = myLightObject.red
	        green[i] = myLightObject.green
	        blue[i] = myLightObject.blue
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

	shader_set(BackgroundShadowShader)

	uni_lightX = shader_get_uniform(BackgroundShadowShader, "lightX")
	uni_lightY = shader_get_uniform(BackgroundShadowShader, "lightY")
	uni_cornerX = shader_get_uniform(BackgroundShadowShader, "myX")
	uni_cornerY = shader_get_uniform(BackgroundShadowShader, "myY")
	uni_xSize = shader_get_uniform(BackgroundShadowShader, "xSize")
	uni_ySize = shader_get_uniform(BackgroundShadowShader, "ySize")
	uni_red = shader_get_uniform(BackgroundShadowShader, "red")
	uni_green = shader_get_uniform(BackgroundShadowShader, "green")
	uni_blue = shader_get_uniform(BackgroundShadowShader, "blue")
	uni_volume = shader_get_uniform(BackgroundShadowShader, "myVolume")
	uni_lightLayer = shader_get_uniform(BackgroundShadowShader, "lightLayer")
	uni_myLayer = shader_get_uniform(BackgroundShadowShader, "myLayer")
	uni_pixelW = shader_get_uniform(BackgroundShadowShader, "pixelW")
	uni_pixelH = shader_get_uniform(BackgroundShadowShader, "pixelH")
	uni_lightNumber = shader_get_uniform(BackgroundShadowShader, "lightNumber")


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
	shader_set_uniform_f(uni_pixelW, pixelW)
	shader_set_uniform_f(uni_pixelH, pixelH)
	shader_set_uniform_i(uni_lightNumber, lightNumber)


	draw_sprite_ext(sprite, index, xval, yval, 1, 1, rot, color, alpha)
	shader_reset()




}

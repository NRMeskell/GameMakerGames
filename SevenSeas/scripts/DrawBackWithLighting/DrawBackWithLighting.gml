/// @description  @description DrawBackWithLighting(background, x, y, color, alpha, layer)
/// @param background
/// @param  x
/// @param  y
/// @param  color
/// @param  alpha
/// @param  layer
function DrawBackWithLighting(argument0, argument1, argument2, argument3, argument4, argument5) {

	//layers: sky, mountains, backship, frontship/backport, frontport
	sprite = argument0
	xval = argument1
	yval = argument2
	color = argument3
	alpha = argument4
	myLayer = argument5
	
	draw_red = (0.5*colour_get_red(color)/255) + 0.5
	draw_green = (0.5*colour_get_red(color)/255) + 0.5
	draw_blue = (0.5*colour_get_red(color)/255) + 0.5

	//draw pre-made surface
	if (!surface_exists(global.backSurf[myLayer]) or (sprite != global.backDrawing[myLayer]) or irandom(room_speed/8) == 0){
	    global.backDrawing[myLayer] = sprite
    
	    if !surface_exists(global.backSurf[myLayer])
	        global.backSurf[myLayer]= surface_create(room_width, room_height)
    
	    surface_set_target(global.backSurf[myLayer])
	    draw_set_blend_mode(bm_subtract)
	    draw_rectangle(0, 0, room_width, room_height, false)
	    draw_set_blend_mode(bm_normal)
	    //Update light vars
	    brightest = 0
    
	    //get page size as xSize
	    uvs = background_get_uvs(sprite)
	    xSize = 640
	    ySize = 360
	    myCornerX = xval
	    myCornerY = yval
    
	    lightNumber = min(instance_number(LightParent),10) div 1
    
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
		if global.lighting > 0
			shader = NewShadowShader
		else
			shader = NoShader
        
	    shader_set(shader)
    
		//if global.lighting > 0{
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
    
	    draw_background_ext(sprite, xval, yval, 1, 1, 0, color, alpha)
	    shader_reset()
	    surface_reset_target()
	    }

	if surface_exists(global.backSurf[myLayer])
	    draw_surface(global.backSurf[myLayer], 0, 0)
}

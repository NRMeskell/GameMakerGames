/// @description Draw Sun and Moon


if view_current = 0
    {
    sunset = 1.5*power(abs(cos(2*pi*((global.timeCycle)/(global.timeCycleLength))))*0.9, 7)
    
    if room != GameRoom or global.weather != 2
        {
        cloudLight = c_white
        skyLight = make_color_rgb(120,140,255)
        }
    else 
        {
        cloudLight = c_dkgray
        skyLight = c_gray
        }
        
    skyColor = merge_color(skyLight, c_black, abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4)))
    cloudColor = merge_color(cloudLight, merge_color(c_white, c_black, 0.95), abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4))) 
        
    draw_set_color(skyColor)
    draw_background_ext(Sky, 0, 0, 1, 1, 0, skyColor, 1)
    draw_background_ext(Stars, 0, 0, 1, 1, 0, -1, power((sin(pi*global.timeCycle/global.timeCycleLength - pi/4)), 4) - 0.2)
    image_angle = -(global.timeCycle/(global.timeCycleLength) * 360)
    
	draw_background_ext(Sunset, 0, 0, 1, 1, 0, -1, sunset)  
	draw_sprite_ext(SunSpr, 0, SunLight.x, SunLight.y, 1, 1, SunLight.image_angle/2 + 45, -1, 1)
    draw_sprite_ext(MoonSpr, MoonLight.image_index, MoonLight.x, MoonLight.y, 1, 1, MoonLight.image_angle/2 + 45, -1, 1)
	with Cloud
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, merge_color(other.cloudColor, c_white, 0.2), image_alpha)
    }    
    


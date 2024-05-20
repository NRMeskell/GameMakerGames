/// @description draw background

if !CharacterCreator.inMenu{
    if !is_undefined(ds_map_find_value(backgroundMap, room))
        myMap = ds_map_find_value(backgroundMap, room)
    else if global.gameMode == "golf"
        if room mod 2{
			if global.golfMapType == "country"
				myMap = GolfBackground
			else if global.golfMapType == "lava"
				myMap = GolfBackgroundLava
		}
        else{
            if global.golfMapType == "country"
				myMap = GolfBackground2
			else if global.golfMapType == "lava"
				myMap = GolfBackgroundLava2
		}
        
    if !is_undefined(ds_map_find_value(backgroundSpeed, room))
        myMapSpeed = ds_map_find_value(backgroundSpeed, room)
    else
        myMapSpeed = 0

    draw_background_ext(SkyBackground, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.HView, 0 )/540, __view_get( e__VW.HView, 0 )/540, 0, c_white, 1)    
    
    with Cloud
        {
        if sprite_index == CloudSpr
            draw_sprite_ext(sprite_index, image_index, (x + __view_get( e__VW.XView, 0 ))*__view_get( e__VW.HView, 0 )/540, (y + __view_get( e__VW.YView, 0 ))*__view_get( e__VW.HView, 0 )/540, image_xscale*__view_get( e__VW.HView, 0 )/540, image_yscale*__view_get( e__VW.HView, 0 )/540, 0, c_white, 1)
        }
        
    draw_background_ext(myMap, __view_get( e__VW.XView, 0 ) + current_time/1000*myMapSpeed mod background_get_width(myMap)*__view_get( e__VW.HView, 0 )/540, __view_get( e__VW.YView, 0 ), __view_get( e__VW.HView, 0 )/540, __view_get( e__VW.HView, 0 )/540, 0, merge_color(c_white, c_gray, 0.4), 1)
    if myMapSpeed != 0
        {
        draw_background_ext(myMap, __view_get( e__VW.XView, 0 ) + current_time/1000*myMapSpeed mod background_get_width(myMap)*__view_get( e__VW.HView, 0 )/540 - (background_get_width(myMap)*__view_get( e__VW.HView, 0 )/540), __view_get( e__VW.YView, 0 ), __view_get( e__VW.HView, 0 )/540, __view_get( e__VW.HView, 0 )/540, 0, merge_color(c_white, c_gray, 0.4), 1)
        draw_background_ext(myMap, __view_get( e__VW.XView, 0 ) + current_time/1000*myMapSpeed mod background_get_width(myMap)*__view_get( e__VW.HView, 0 )/540 + (background_get_width(myMap)*__view_get( e__VW.HView, 0 )/540), __view_get( e__VW.YView, 0 ), __view_get( e__VW.HView, 0 )/540, __view_get( e__VW.HView, 0 )/540, 0, merge_color(c_white, c_gray, 0.4), 1)
        }
    }
else
    draw_background(MenuBackground, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ))


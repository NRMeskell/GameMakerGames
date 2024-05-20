/// @description Draw surfaces
if view_current = 1
    {
    draw_background(seaBackground, mapStart, 0)
    }

///Draw Map Details

with LandingSpot
    event_user(1)
    
with MapShip
    event_user(2)


///Draw Island Names
  
//drawSeaType
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_set_color(c_black)

if zoom == maxZoom
    {
    for(i=0; i<seaNumber; i++)
        {
        drawSeaType = ds_map_find_value(seas[i], "type")
        drawX = ds_map_find_value(seas[i], "x")
        drawY = ds_map_find_value(seas[i], "y")
        draw_set_halign(fa_center)
        draw_set_valign(fa_center)
        draw_set_color(c_black)
        drawName = drawSeaType
        
        draw_text_transformed(mapStart + seaSizeX/2 +drawX+2, seaSizeY/2 + drawY, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_text_transformed(mapStart + seaSizeX/2 +drawX, seaSizeY/2 + drawY+2, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_text_transformed(mapStart + seaSizeX/2 +drawX-2, seaSizeY/2 + drawY, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_text_transformed(mapStart + seaSizeX/2 +drawX, seaSizeY/2 + drawY-2, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        
        if ds_map_find_value(seas[i], "conquered") == false
            {
            if ds_map_find_value(seas[i], "level") == 0
                draw_set_color(make_color_rgb(110, 110, 110))
            else if ds_map_find_value(seas[i], "level") == 1
                draw_set_color(make_color_rgb(154, 122, 2))
            else if ds_map_find_value(seas[i], "level") == 2
                draw_set_color(make_color_rgb(175, 100, 20))
            else
                draw_set_color(make_color_rgb(180, 15, 15))
            }
        else
            draw_set_color(merge_color(make_color_rgb(10, 180, 10), c_dkgray, 0.4))
        
        draw_text_transformed(mapStart + seaSizeX/2 +drawX, seaSizeY/2 + drawY, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        }
    }

draw_set_font(global.PirateFont)


///Draw GUI Sumbols
  
if !overBoatButton and !onBoat
    draw_sprite_ext(EndCombatSpr, 2, __view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 ) - (buttonWidth*zoom*1.5), __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, -1, 1)
else
    draw_sprite_ext(EndCombatSpr, 2, __view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 ) - (buttonWidth*zoom*1.5), __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, c_ltgray, 1)
 
if !overPause
    draw_sprite_ext(EndCombatSpr, 3+global.mapPause, __view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 ) - buttonWidth*zoom*0.5, __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, -1, 1)
else
    draw_sprite_ext(EndCombatSpr, 3+global.mapPause, __view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 ) - buttonWidth*zoom*0.5, __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, c_ltgray, 1)
  
    
if !overZoomIn and zoom != minZoom
    draw_sprite_ext(EndCombatSpr, 5, __view_get( e__VW.XView, 1 ) + buttonWidth*zoom*0.5, __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, -1, 1)
else
    draw_sprite_ext(EndCombatSpr, 5, __view_get( e__VW.XView, 1 ) + buttonWidth*zoom*0.5, __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, c_ltgray, 1)

if !overZoomOut and zoom != maxZoom
    draw_sprite_ext(EndCombatSpr, 6, __view_get( e__VW.XView, 1 ) + buttonWidth*zoom*1.5, __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, -1, 1)
else
    draw_sprite_ext(EndCombatSpr, 6, __view_get( e__VW.XView, 1 ) + buttonWidth*zoom*1.5, __view_get( e__VW.YView, 1 ) + buttonHeight*zoom, zoom, zoom, 0, c_ltgray, 1)

       
//drawSeaType
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_set_color(merge_color(c_red,c_black,0.3))
draw_set_font(global.LargePirateFont)
draw_text_transformed(__view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 )/2, __view_get( e__VW.YView, 1 ) + 11*zoom, string_hash_to_newline(global.seaType), zoom, zoom, 0)
draw_set_color(c_black)

draw_set_font(global.PirateFont)

///Get view to surface

if !surface_exists(surf)
    {
    surf = surface_create(__view_get( e__VW.WPort, 1 ), __view_get( e__VW.HPort, 1 ));
    }

__view_set( e__VW.SurfaceID, 1, surf );

/* */
/*  */

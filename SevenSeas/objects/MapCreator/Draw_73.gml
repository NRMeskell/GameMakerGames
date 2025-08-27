/// @description Draw surfaces
if view_current = 1{

	/*if !surface_exists(seenSurface){
		seenSurface = surface_create(mapSizeX, mapSizeY);
		seenBackground = background_add(SaveGameRunner.gameName + "-MapSeenFile.png", false, false)
	
		surface_set_target(seenSurface);
		draw_background(seenBackground, 0, 0);
		surface_reset_target();
		sprite_delete(seenBackground)
	}	
	surface_set_target(seenSurface);
	draw_set_blend_mode(bm_subtract);
	draw_circle(MapShip.x - mapStart, MapShip.y, MapShip.viewDistance, false);
	draw_set_blend_mode(bm_normal);
	surface_reset_target();
	*/
	
	draw_background_part(seaBackground, background_get_width(seaBackground)-seaScroll, 0, seaScroll, background_get_height(seaBackground), mapStart, 0)
	draw_background_part(seaBackground, 0, 0, background_get_width(seaBackground)-seaScroll, background_get_height(seaBackground), mapStart + seaScroll, 0)
	draw_background_ext(MapBackground, mapStart, 0, 1, 1, 0, c_white, 0.3)
	
		
	shader_set( MapWaveShader );
	texture_set_stage( disSampler, sampTexture );
	draw_set_color(c_dkgray)
	draw_background_ext(distanceBackground, mapStart, 0, 1, 1, 0, c_white, 0.35-((seaScroll/100) mod 0.35))
	shader_reset();
	
	seaScroll += 0.08
	if seaScroll > mapSizeX
		seaScroll = 0
	//draw_set_alpha(0.15)
	//draw_surface(seenSurface, mapStart, 0)
	//draw_set_alpha(1)
	
	draw_sprite(sprite_index, 0, mapStart, 0)
	
	/*draw_set_alpha(0.5)
	mp_grid_draw(global.mapGrid)
	draw_set_alpha(1)*/
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
        
        draw_text_transformed(mapStart + mapSizeX/2 +drawX+2, mapSizeY/2 + drawY, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_text_transformed(mapStart + mapSizeX/2 +drawX, mapSizeY/2 + drawY+2, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_text_transformed(mapStart + mapSizeX/2 +drawX-2, mapSizeY/2 + drawY, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_text_transformed(mapStart + mapSizeX/2 +drawX, mapSizeY/2 + drawY-2, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        draw_set_color(seas[i][? "conquered"] ? c_green :  merge_color(landColor[? drawName], c_white, 0.25))
		draw_text_transformed(mapStart + mapSizeX/2 +drawX, mapSizeY/2 + drawY, string_hash_to_newline(drawName), zoom*1.2, zoom*1.2, 0)
        
		draw_set_color(c_black)
		draw_text_transformed(mapStart + mapSizeX/2 + drawX -2, mapSizeY/2 + drawY-2 + 24, "level: " + string(ds_map_find_value(seas[i], "level")+1), zoom, zoom, 0)
		draw_text_transformed(mapStart + mapSizeX/2 + drawX +2, mapSizeY/2 + drawY-2 + 24, "level: " + string(ds_map_find_value(seas[i], "level")+1), zoom, zoom, 0)
		draw_text_transformed(mapStart + mapSizeX/2 + drawX, mapSizeY/2 + drawY-2 + 22, "level: " + string(ds_map_find_value(seas[i], "level")+1), zoom, zoom, 0)
		draw_text_transformed(mapStart + mapSizeX/2 + drawX, mapSizeY/2 + drawY-2 + 26, "level: " + string(ds_map_find_value(seas[i], "level")+1), zoom, zoom, 0)
	
		draw_set_color(seas[i][? "conquered"] ? c_green : make_color_rgb(100, 100, 100))
		draw_text_transformed(mapStart + mapSizeX/2 + drawX, mapSizeY/2 + drawY-2 + 24, "level: " + string(ds_map_find_value(seas[i], "level")+1), zoom, zoom, 0)
		draw_set_color(c_black)
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
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_set_color(merge_color(c_red,c_black,0.3))
draw_set_font(global.LargePirateFont)
draw_text_ext_transformed(__view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 )/2, __view_get( e__VW.YView, 1 ) + 6*zoom, string_hash_to_newline(global.seaType), 14, 100, zoom, zoom, 0)
draw_set_color(c_black)
draw_set_valign(fa_center)
draw_set_font(global.PirateFont)

///Get view to surface

if !surface_exists(surf)
    {
    surf = surface_create(max(1,__view_get( e__VW.WPort, 1 )), max(1,__view_get( e__VW.HPort, 1 )));
    }

__view_set( e__VW.SurfaceID, 1, surf );

/* */
/*  */

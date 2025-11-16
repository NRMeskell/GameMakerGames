if (view_current == 0)
{
///Draw Background Land

with Clock
	event_user(1)

// Draw volcano	
if global.seaType == global.seaNames[4]{
	var volPos; 
	
	if !global.inPort
		volPos = (path_get_length(MapShip.sailPath)/(MapCreator.mapSizeX/6) - MapShip.path_position) * ((path_get_length(MapShip.sailPath)/MapShip.normalSailSpeed)*landSpeed/5) + 100
	else
		volPos = room_width*0.3 + room_width*0.6*(GameStatsController.locationsVisted/10 mod 1)
	
	shader_set(VolcanicShader)
	
	if instance_exists(WaveMaker) and WaveMaker.eruption{
		draw_sprite_ext(VolcanoSpewSpr, current_time div 160, volPos-15, room_height/2 + landYShift - 130, 1, 1, 0, c_white, 1)
		draw_sprite_ext(VolcanoSpewSpr, current_time div 160, volPos-14, room_height/2 + landYShift - 130+1, 1, 1, 0, c_black, 0.5)
	}
	
	draw_sprite_ext(VolcanoBackLand, Volcano.myVar, volPos, room_height/2 + landYShift - 100, 1, 1, 0, merge_color(c_white, Clock.cloudColor, 0.8), 1)
}

// Draw back land
if !global.inPort {
    for(var i=0; i<ds_list_size(MapShip.islandPoints); i++) {
        var myDrawSpot = ds_list_find_value(MapShip.islandPoints, i)
        var drawPlace = (myDrawSpot - MapShip.path_position) * ((path_get_length(MapShip.sailPath)/MapShip.normalSailSpeed)*landSpeed) + 100 + myDrawSpot*300

		draw_background_part_ext(landMap[? global.seaType], islandPoint[i mod 2], 0, islandPoint[(i mod 2) + 1] - islandPoint[i mod 2], background_get_height(landMap[? global.seaType]), drawPlace, room_height/2 + landYShift, 1, 1, merge_color(c_white, Clock.cloudColor, 0.8), 1)
	}
}
else {
    draw_background_ext(landMap[? global.seaType], 0, room_height/2 + landYShift, 1, 1, 0, merge_color(c_white, Clock.cloudColor, 0.8), 1)
}

shader_reset();

///Draw Back Waves

with SailingDecor if y == Ship.backWaves.waveBase
	event_user(0)

with backWaves
	event_user(0)
	
}

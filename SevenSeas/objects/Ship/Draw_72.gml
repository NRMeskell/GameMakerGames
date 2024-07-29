if (view_current == 0)
{
///Draw Background Land

with Clock
	event_user(1)

if !global.inPort {
    for(i=0; i<ds_list_size(MapShip.islandPoints); i++) {
        myDrawSpot = ds_list_find_value(MapShip.islandPoints, i)
        drawPlace = (myDrawSpot - MapShip.path_position) * ((path_get_length(MapShip.sailPath)/MapShip.normalSailSpeed)*landSpeed) + 100 + myDrawSpot*300
        draw_background_part_ext(landMap[? global.seaType], islandPoint[i mod 4], 0, islandPoint[(i mod 4) + 1] - islandPoint[i mod 4], background_get_height(landMap[? global.seaType]), drawPlace, room_height/2 + landYShift, 1, 1, merge_color(c_white, Clock.cloudColor, 0.8), 1)
        draw_background_part(BackgroundLandShading, islandPoint[i mod 4], 0, islandPoint[(i mod 4) + 1] - islandPoint[i mod 4], background_get_height(landMap[? global.seaType]), drawPlace, room_height/2 + landYShift)
    }
}
else {
    draw_background_ext(landMap[? global.seaType], 0, room_height/2 + landYShift, 1, 1, 0, merge_color(c_white, Clock.cloudColor, 0.8), 1)
    draw_background(BackgroundLandShading,  0, room_height/2 + landYShift)
}

///Draw Back Waves

with SailingDecor if y == Ship.backWaves.waveBase
	event_user(0)

with backWaves
	event_user(0)
	
}

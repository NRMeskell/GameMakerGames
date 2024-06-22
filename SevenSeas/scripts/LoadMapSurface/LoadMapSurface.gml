function LoadMapSurface(argument0) {
	MapCreator.sprite_index = background_add(argument0 + "-MapIslandFile.png", false, false)
	
	if !surface_exists(MapCreator.seenSurface){
		MapCreator.seenSurface = surface_create(MapCreator.mapSizeX, MapCreator.mapSizeY);
	}
	
	seenBackground = background_add(argument0 + "-MapSeenFile.png", false, false)
	surface_set_target(MapCreator.seenSurface);
	draw_clear_alpha(c_black, 0);
	draw_background(seenBackground, 0, 0);
	surface_reset_target();
	sprite_delete(seenBackground)
	
	tempGrid = ds_grid_create(MapCreator.mapSizeX div MapCreator.gridSize, MapCreator.mapSizeY div MapCreator.gridSize)

	mp_grid_clear_all(global.mapGrid)

	ini_open(argument0 + "-mapGrid.ini")
	ds_grid_read(tempGrid, ini_read_string("grid", "0", ""))
	ini_close()

	for(i=0; i<ds_grid_height(tempGrid); i++){
	    for(j=0; j<ds_grid_width(tempGrid); j++){
	        if ds_grid_get(tempGrid, j, i) != false{
	            mp_grid_add_cell(global.mapGrid, j, i)
	        }
	    }
	}

	ds_grid_destroy(tempGrid)
}

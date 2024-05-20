function LoadMapSurface(argument0) {

	background = background_add(argument0 + "-MapSurfaceFile.png", false, false)
	MapCreator.seaBackground = background

	tempGrid = ds_grid_create(MapCreator.seaSizeX div MapCreator.gridSize, MapCreator.seaSizeY div MapCreator.gridSize)

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

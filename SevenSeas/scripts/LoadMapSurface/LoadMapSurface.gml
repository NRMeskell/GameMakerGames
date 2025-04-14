function LoadMapSurface(argument0) {
	MapCreator.sprite_index = sprite_add(argument0 + "\\MapIslandFile.png", 0, false, false, 0, 0)
	MapCreator.distanceBackground = background_add(argument0 + "\\MapDistanceFile.png", false, false)
		
	tempGrid = ds_grid_create(MapCreator.mapSizeX div MapCreator.gridSize, MapCreator.mapSizeY div MapCreator.gridSize)
	
	ini_open(argument0 + "\\MapGrid.ini")
	ds_grid_read(tempGrid, ini_read_string("Grid", "0", ds_grid_write(tempGrid)));
	ini_close()
	ds_grid_to_mp_grid(tempGrid, global.mapGrid)
	ds_grid_destroy(tempGrid)
}

/// @description sea surface reading
function SaveMapSurface(argument0) {

	//seen background also saved in SaveLandingSpots
	surface_save(MapCreator.seenSurface, argument0 + "-MapSeenFile.png");
	sprite_save(MapCreator.islandBackground, 0, argument0 + "-MapIslandFile.png");

	tempGrid = ds_grid_create(MapCreator.seaSizeX div MapCreator.gridSize, MapCreator.seaSizeY div MapCreator.gridSize)
	mp_grid_to_ds_grid(global.mapGrid, tempGrid)

	ini_open(argument0 + "-mapGrid.ini")
	ini_write_string("grid", "0", ds_grid_write(tempGrid))
	ini_close()

	ds_grid_destroy(tempGrid)
}

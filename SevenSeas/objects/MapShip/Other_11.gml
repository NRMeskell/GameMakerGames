/// @description Set Islands

for(pathSpot = 0; pathSpot < 1; pathSpot += 0.01)
    {
    addSpot = false
    posX = path_get_x(sailPath, pathSpot)
    posY = path_get_y(sailPath, pathSpot)
    
    for(i=0; i<360; i += 6)
        {
        rad = 2
        if mp_grid_get_cell(global.mapGrid, (posX - MapCreator.mapStart + dcos(i)*rad) div MapCreator.gridSize, (posY + dsin(i)*rad) div MapCreator.gridSize) == -1
            addSpot = true
        }
        
    for(i=0; i< ds_list_size(islandPoints); i++)
        {
        checkPos = ds_list_find_value(islandPoints, i)
        if abs(pathSpot - checkPos) * ((path_get_length(sailPath)/sailSpeed)*Ship.landSpeed) < 300
            addSpot = false
        }
        
    if addSpot
        ds_list_add(islandPoints, pathSpot)
    }
    
ds_list_add(islandPoints, 1)

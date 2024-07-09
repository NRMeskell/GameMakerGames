/// @description Set Islands
ds_list_clear(islandPoints)

for(pathSpot = 0; pathSpot < 1; pathSpot += (normalSailSpeed/Ship.landSpeed*300)/path_get_length(sailPath)){
    posX = path_get_x(sailPath, pathSpot)
    posY = path_get_y(sailPath, pathSpot)
    
    if collision_circle(posX, posY, 40, MapCreator, true, false){
		ds_list_add(islandPoints, pathSpot)
    }
}
    
ds_list_add(islandPoints, 1)


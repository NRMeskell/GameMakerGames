/// @description release seas    

//initialize landing spot data
with LandingSpot{
    released = false
    myIslandType = "none"
    
    //find closest sea
    closeSeaDis = 10000
    for(i=0; i<7; i++){
        seaX = MapCreator.mapStart + MapCreator.seaSizeX/2 + ds_map_find_value(MapCreator.seas[i], "x")
        seaY = MapCreator.seaSizeY/2 + ds_map_find_value(MapCreator.seas[i], "y")
        if point_distance(x, y, seaX, seaY) < closeSeaDis{
            myIslandType = ds_map_find_value(MapCreator.seas[i], "type")
            closeSeaDis = point_distance(x, y, seaX, seaY)
            }
        }
    }
    
//find if content released
for(i=0; i<7; i++){
    if ds_map_find_value(released, global.seaNames[i]){
        with LandingSpot
            if myIslandType == global.seaNames[other.i]
                released = true
    }
}
    



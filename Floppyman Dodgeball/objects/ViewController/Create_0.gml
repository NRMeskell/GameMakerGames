/// @description vars

moveSpeed = 1

backgroundMap = ds_map_create()
ds_map_add(backgroundMap, FarmGameRoom, FarmBackground)
ds_map_add(backgroundMap, BoatGameRoom, SteamBoatBackground)
ds_map_add(backgroundMap, BlimpGameRoom, BlimpBackground)
ds_map_add(backgroundMap, FerrisWheelRoom, FerrisBackground)
ds_map_add(backgroundMap, CastleGameRoom, CastleBackground)
ds_map_add(backgroundMap, BridgeGameRoom, BridgeBackground)
ds_map_add(backgroundMap, FactoryGameRoom, FactoryBackground)
ds_map_add(backgroundMap, SkiLodgeGameRoom, SkiBackground)

//Speed (pixels per seconds)
backgroundSpeed = ds_map_create()
ds_map_add(backgroundSpeed, FarmGameRoom, 0)
ds_map_add(backgroundSpeed, BoatGameRoom, 8)
ds_map_add(backgroundSpeed, BlimpGameRoom, -5)
ds_map_add(backgroundSpeed, FerrisWheelRoom, 0)
ds_map_add(backgroundSpeed, CastleGameRoom, 0)
ds_map_add(backgroundSpeed, BridgeGameRoom, 0)
ds_map_add(backgroundSpeed, FactoryGameRoom, 0)
ds_map_add(backgroundSpeed, SkiLodgeGameRoom, 0)
ds_map_add(backgroundSpeed, SkiLodgeGameRoom, 0)

if global.gameMode == "golf"{
    x = TeeBox.x
    y = TeeBox.y
    }
else{
    x = room_width/2
    y = room_height/2
    }



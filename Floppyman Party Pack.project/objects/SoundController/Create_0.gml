/// @description Vars

audio_system()

currentRoom = room
audio_play_sound(MenuMusic, 2, true)

musicMap = ds_map_create()

//Menus
ds_map_add(musicMap, MenuRoom, MenuMusic)
ds_map_add(musicMap, TitleRoom, MenuMusic)
ds_map_add(musicMap, PartyPackRoom, MenuMusic)
ds_map_add(musicMap, GolfMenuRoom, GolfMenuMusic)

//Golf Rooms
ds_map_add(musicMap, GolfMap1A, GolfMapMusic)
ds_map_add(musicMap, GolfMap2A, GolfMapMusic)
ds_map_add(musicMap, GolfMap3A, GolfMapMusic)
ds_map_add(musicMap, GolfMap4A, GolfMapMusic)
ds_map_add(musicMap, GolfMap5A, GolfMapMusic)
ds_map_add(musicMap, GolfMap6A, GolfMapMusic)
ds_map_add(musicMap, GolfMap7A, GolfMapMusic)
ds_map_add(musicMap, GolfMap8A, GolfMapMusic)
ds_map_add(musicMap, GolfMap9A, GolfMapMusic)

//DodgeBall rooms
ds_map_add(musicMap, BoatGameRoom, BoatMusic)
ds_map_add(musicMap, FarmGameRoom, FarmMusic)
ds_map_add(musicMap, BlimpGameRoom, BlimpMusic)
ds_map_add(musicMap, FerrisWheelRoom, FerrisWheelMusic)
ds_map_add(musicMap, CastleGameRoom, CastleMusic)
ds_map_add(musicMap, BridgeGameRoom, BridgeMusic)
ds_map_add(musicMap, FactoryGameRoom, FactoryMusic)
ds_map_add(musicMap, SkiLodgeGameRoom, SkiLodgeMusic)




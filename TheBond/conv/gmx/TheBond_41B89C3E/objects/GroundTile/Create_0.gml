/// @description vars

image_xscale = choose(-1, 1)

groundMap = ds_map_create()
ds_map_add(groundMap, GroundDeadSpr, GroundSpr)
ds_map_add(groundMap, GrassDeadSpr, GrassSpr)
ds_map_add(groundMap, WaterDeadSpr, WaterEdgeSpr)
ds_map_add(groundMap, StoneDeadSpr, StoneSpr)
dead = true


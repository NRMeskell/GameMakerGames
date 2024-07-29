/// @description Pirate Ship Vars

var decorType = ds_map_create()
decorType[? global.seaNames[0]] = choose(0,1)
decorType[? global.seaNames[1]] = choose(0,2)
decorType[? global.seaNames[2]] = choose(1,3)

image_index = decorType[? global.seaType]
ds_map_destroy(decorType)

image_speed = 0
y = choose(Ship.frontWaves.waveBase, Ship.backWaves.waveBase)
x = room_width + 136/2
floatAway = true

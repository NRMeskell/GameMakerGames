/// @description Path


moveSpeed = 2*pi*(sprite_get_width(FactoryWheel))/room_speed*FactorySpawner.beltSpeed

path_start(FactoryCartPath, moveSpeed*sqrt(global.timeDiff), path_action_restart, true)


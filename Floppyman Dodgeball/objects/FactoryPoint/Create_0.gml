/// @description Path


moveSpeed = pi*sprite_get_width(FactoryWheelSpr)/360 * FactorySpawner.beltSpeed

path_start(FactoryCartPath, moveSpeed*sqrt(global.timeDiff), path_action_restart, true)


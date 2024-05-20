action_set_alarm(1, 0);
///Vars
waterSpeed = 0.5
waterPos = 0
spawnRate = 1000
spawnVar = 1.5

carRateMin = room_speed*1
carRateMax = room_speed*20

alarm[1] = irandom_range(carRateMin, carRateMax)/global.timeDiff


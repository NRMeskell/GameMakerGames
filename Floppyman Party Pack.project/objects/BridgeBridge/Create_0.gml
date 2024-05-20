/// @description Vars

minLevel = y
maxLevel = y - 305
bridgeSpeed = 2
bridgeUpTime = room_speed * 10
bridgeDownTime = room_speed * 20
moving = 0

alarm[0] = bridgeDownTime*random_range(0.75, 1.25)/global.timeDiff


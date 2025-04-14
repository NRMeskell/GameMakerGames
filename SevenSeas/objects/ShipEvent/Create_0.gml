/// @description Pirate Ship Vars

mySound = audio_play_sound(ShipwreckSnd, 0, true)

flagColor = c_dkgray

myShipTypes[0] = 0
myShipTypes[1] = choose(1,2,3)
myShipTypes[2] = choose(1,2,3)
myShipTypes[3] = choose(1,2,3)

shipType = myShipTypes[global.seaLevel]
myShipHull = global.hullDict[shipType]

image_speed = 0
placeX = 65
myFlag = PirateFlagSpr

floatAway = false

enemyLevel = 0



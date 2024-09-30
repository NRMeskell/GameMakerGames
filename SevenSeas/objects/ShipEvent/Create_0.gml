/// @description Pirate Ship Vars

mySound = audio_play_sound(ShipwreckSnd, 0, true)


hasFlags = true
flagColor = c_dkgray

myShipTypes[0] = choose(0)
myShipTypes[1] = choose(1,2,3)
myShipTypes[2] = choose(1,2,3)
myShipTypes[3] = choose(1,2,3)

shipType = myShipTypes[global.seaLevel]
myShipHull = Ship.hullDict[shipType]

myFlagX = Ship.flagX[shipType]
myFlagY = Ship.flagY[shipType]

image_speed = 0
placeX = 65
myFlag = PirateFlagSpr

floatAway = false

enemyLevel = 0



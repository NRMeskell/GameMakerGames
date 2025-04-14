/// @description Arive Vars
alarm[1] = room_speed*random_range(3, 5)

mouseOnMapX = 0
mouseOnMapY = 0
moveX = x
moveY = y

slotX[0] = 290 + 48 + Ship.drawPortShiftX
slotX[1] = 390 + 48 + Ship.drawPortShiftX
slotX[2] = 490 + 48 + Ship.drawPortShiftX

slotY[0] = 72 + 128 + Ship.drawPortShiftY
slotY[1] = 108 + 128 + Ship.drawPortShiftY
slotY[2] = 48 + 128 + Ship.drawPortShiftY
 
targetPort = instance_nearest(x,y,LandingSpot)

///Vars
xPrev = x

targetPort = instance_nearest(x,y,LandingSpot)
islandPoints = ds_list_create()

normalViewDistance = 40
viewDistance = normalViewDistance
sailPath = path_add()
normalSailSpeed = 0.125
sailSpeed = normalSailSpeed

image_speed = 0

///Level Vars

global.seaType = ""
global.seaLevel = 0

alarm[0] = room_speed 
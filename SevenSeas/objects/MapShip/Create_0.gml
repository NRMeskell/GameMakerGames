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

sailSpeedModifier = 0.05
normalViewDistance = 40
viewDistanceModifier = 0.2
viewDistance = normalViewDistance
sailPath = path_add()
normalSailSpeed = 0.12
sailSpeed = normalSailSpeed

image_speed = 0

///StartingPort

with LandingSpot
    {
    image_index = 1
    slotNumber = 3
    
    slotBuild[0] = instance_create(-100, -100, Tavern)
    slotBuild[0].mySlot = 0
    slotBuild[0].myPortType = image_index
    
    slotBuild[1] = instance_create(-100, -100, Taylors)
    slotBuild[1].mySlot = 1
    slotBuild[1].myPortType = image_index
    
    slotBuild[2] = instance_create(-100, -100, Smithy)
    slotBuild[2].mySlot = 2
    slotBuild[2].myPortType = image_index
        
    for(i=0; i<slotNumber; i++)
        {
        slotBuild[i].x = MapShip.slotX[slotBuild[i].mySlot]
        slotBuild[i].y = MapShip.slotY[slotBuild[i].mySlot]
        slotBuild[i].image_speed = 0.2
        }
    
    visited = true
    }

///Level Vars

global.seaType = ""
global.seaLevel = 0

alarm[0] = room_speed 
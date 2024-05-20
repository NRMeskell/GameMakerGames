/// @description Vars

spriteIndex = ShipIconSpr
myShipType = 0

xWindow = 445 - (sprite_get_width(ItemSheetSpr) + 10) 
yWindow = room_height/2 - sprite_get_height(CargoSheetPreviewSpr)/2

closeX = xWindow + sprite_get_width(CargoSheetPreviewSpr)-2
closeY = yWindow + 2

overClose = false
preview = false
previewSelect = false

selected = false
overButton = false

viewed = false

name = Ship.shipName[myShipType]
description = Ship.shipDescription[myShipType]
previewName = ""

myHealth = Ship.maxHealthType[myShipType]
maxCrew = Ship.shipMaxCrew[myShipType]

myRigging = Ship.shipSlots[0,myShipType]
myCannons = Ship.shipSlots[1,myShipType]
myBeds = Ship.shipSlots[2,myShipType]
myCargo = Ship.shipSlots[3,myShipType]

drawX = 100
drawY = 100

cost = 0

alarm[0] = 2
alarm[1] = 2


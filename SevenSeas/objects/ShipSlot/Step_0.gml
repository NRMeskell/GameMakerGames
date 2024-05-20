/// @description Change Positions

x = xSpot[Ship.shipType] - 60 + Ship.xWindow
y = ySpot[Ship.shipType] - 10 + Ship.yWindow

if slotType = "storage"
    {
    if damaged = true
        image_index = 7
    else
        image_index = 2
    }
else
    {
    if damaged = true
        image_index = 6
    else
        image_index = 0
    }
    
if occupied = true 
    if myThing.selected = true
        image_index = 1


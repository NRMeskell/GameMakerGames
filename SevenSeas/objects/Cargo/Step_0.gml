/// @description Select

if !instance_exists(Defeat) and (Ship.portSelect = true or global.inPort = false and !global.itemSelected and !instance_exists(DumpItem))
    {
    if mouse_check_button_pressed(mb_left) and !instance_exists(DumpItem)
        {
        overButton = point_in_rectangle(mouse_x, mouse_y, xReal-realWidth/2, yReal-realHeight/2, xReal + realWidth/2, yReal + realHeight/2)
        
        if overButton and global.menuShipLayer = 2
            {
            with Cargo
                if selected = true and id != other.id
                    {
                    if cargoType = other.cargoType and cargoAmount + other.cargoAmount < 10
                        {
                        other.cargoAmount += cargoAmount
                        event_user(2)
                        
                        exit
                        }
                    }
            event_user(1)
            }
        }
    }
else
    event_user(0)

///Slots

//Move Slot
if selected = true
    {   
    if mouse_check_button_pressed(mb_left)  and !instance_exists(DumpItem)
        with ShipSlot
            {
            if point_in_rectangle(mouse_x, mouse_y, x, y, x+24, y+24)
                {
                if occupied = false and global.menuShipLayer = myLayer and slotType = "storage"
                    {
                    myThing = other.id
                    other.mySlot.occupied = false
                    occupied = true
                    other.mySlot = id
                    
                    with other
                        event_user(0)
                    }
                }
            }   
    }

//Show Layered Slot
if mySlot.myLayer = global.menuShipLayer
    {
    showReal = true
    }
else
    {
    showReal = false
    selected = false
    }
    
xReal = mySlot.x + 1 + realWidth/2
yReal = mySlot.y + 1 + realHeight/2

///Dump

overDump = point_in_rectangle(mouse_x, mouse_y, dumpX, dumpY, dumpX+realWidth+2, dumpY+realHeight+2)

if selected
    {
    if overDump and !instance_exists(DumpItem)
        {
        if mouse_check_button_pressed(mb_left) 
            with instance_create(0,0,DumpItem)
                {
                caption = "Do you want to dump " + string(other.cargoAmount) + " " + ItemRunner.cargoName[other.cargoType] + " overboard?"
                myEvent = 0
                myDump = other.id
                }
        }
    }
    
if cargoAmount <= 0
    event_user(2)


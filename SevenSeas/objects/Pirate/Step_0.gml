/// @description Slots

if myHealth < 1{
	event_user(2)
	exit;
}	

if !instance_exists(DumpItem){

canMoveCombat = true
with ActionParent
    if selected
        other.canMoveCombat = false

//Move Slot
if selected = true and !instance_exists(Event) and ds_list_size(global.notificationList) < 1 and __view_get( e__VW.XView, 0 ) = 0
    {   
    if mouse_check_button_pressed(mb_left)
        with ShipSlot
            {
            if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x, y, x+24, y+24)
                {
                if occupied = false and global.menuShipLayer = myLayer and slotType != "storage" and other.canMoveCombat
                    {
                    if other.myPet.itemPower != "combat move"{
                        with CombatRunner
                            {
                            event_user(1)
                            canEndTurn = true
							piratesMoved = true
                            }
                        }
                    
                    myThing = other.id
                    other.mySlot.occupied = false
                    occupied = true
                    other.mySlot = id
                    
					if !instance_exists(CombatRunner) and slotType != "bed"
						other.myMainSlot = other.mySlot
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
    }
    
xReal = mySlot.x + 1 
yReal = mySlot.y + 1

/* */
///Stats

//sword, gun, cannon, wheel, sailing, lookout, medic, barder, survival

item[0] = myShirt
item[1] = myHat
item[2] = myPants
item[3] = myRightHand
item[4] = myLeftHand
item[5] = myPet

itemString[0] = "shirt"
itemString[1] = "hat"
itemString[2] = "pants"
itemString[3] = "hands"
itemString[4] = "hands"
itemString[5] = "item"

for(i=0; i<9; i++){
    statString[i] = ""
    bonus[i] = 0
    haveItem[i] = false //tracks whether to display the icon
    
    for(r=0; r<array_length_1d(item); r++){
        itemBonus = item[r].bonus[i]
        if (r==3){
            if (item[r] != item[r+1]) //calculate left hand bonus
                itemBonus += item[r+1].bonus[i]
            
            r++ //skip left hand in loop
            }
        if itemBonus > 0{
            statString[i] += itemString[r] + " +" + string(itemBonus) + "#"
            haveItem[i] = true
            }
        if itemBonus < 0
            statString[i] += itemString[r] + " -" + string(abs(itemBonus)) + "#"
        
        bonus[i] += itemBonus
        }
    if string_length(statString[i]) > 0
        string_delete(statString[i], string_length(statString[i]), 1)
    }

for(i=0; i<9; i++){
    statTotal[i] = bonus[i]
    if ((i != 0) and (i != 1)) or (bonus[i] != 0)
        {
        statTotal[i] += stat[i]
        if stat[i] > 0
            statString[i] = "pirate +" + string(stat[i]) + "#" + statString[i]
        if stat[i] < 0
            statString[i] = "pirate -" + string(abs(stat[i])) + "#" + statString[i]
        }
    statTotal[i] = max(0, statTotal[i])
    }   

/* */
///Injured/Heal

if myHealth < 1{
	event_user(2)
    }
    
if !instance_exists(CombatRunner)
    stunned = false
    
//Create Eye Actions
if (eyeLostRight or eyeLostLeft) and myAction[2] != LostEyeAction
    myAction[2] = LostEyeAction
if (eyeLostRight and eyeLostLeft) and myAction[1] != LostEyeAction
    myAction[1] = LostEyeAction
    
    
//UpdateHealthDiff
if abs(healthDiff - myHealth) > 1
    {
	if healthDiffTimer == 0 and myHealth < healthDiff and ((random(1) + random(1))/2 < abs(healthDiff - myHealth)/healthDiff){
        LoseLimb(undefined)
        global.moraleBoost = "injured"
        UpdateMorale(-2, -1)
		}
		
    if !updateHealthDiff
        healthDiffTimer ++
        
    if healthDiffTimer > room_speed*healthTimer
        updateHealthDiff = true
        
    if updateHealthDiff
        healthDiff += sign(myHealth - healthDiff)
    }
else
    {
    healthDiff = myHealth
    updateHealthDiff = false
    healthDiffTimer = 0
    }

/* */
///Morale Controller
    
if prevMorale != morale
    {
    moraleDiff = morale - prevMorale
    for(i=0; i<abs(moraleDiff); i++)
        with instance_create(Ship.drawTagX + 64, Ship.drawTagY + myTagPlace + tagShift + 17 + 10*sign(moraleDiff), MoraleDisplay)
            {
            myPirate = other.id
            alarm[0] = 1 + room_speed/3*other.i
            image_index = (1 + sign(other.moraleDiff)) div 2
            }
            
    ds_list_insert(myMoraleReasons, 0, global.moraleBoost)
    ds_list_insert(myMoraleReasons, 0, moraleDiff)
    }
    
if ds_list_size(myMoraleReasons) > 8{
    ds_list_delete(myMoraleReasons, 8)
    }
    
if morale < -3
    morale = -3
if morale <= moraleMax[stars]
	leveling = false
	
if morale > moraleMax[stars] and !instance_exists(PirateLeveler) and !instance_exists(Event) and !instance_exists(CombatRunner) {
	if stars < 3 and myAction[stars] != LostEyeAction
		PirateLevelUp(true, true)
	else if HasStored(5, 1){
		with instance_create(-1000, room_height/2, PirateLevelChooser){
			myPirate = other.id
			event_user(0)
		}
	}
}
    
prevMorale = morale

/* */
///Open Equipment Slots

overClose = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow + sprite_get_width(PirateSheetSpr)-2, yWindow + 2, 10)
if selected and ((mouse_check_button_pressed(mb_left) and overClose) or (ds_list_size(global.notificationList) > 0))
	event_user(0)


overHat = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow+drawX1-13, yWindow+drawY1-13, xWindow+drawX1+13, yWindow+drawY1+13)
overShirt = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow+drawX2-13, yWindow+drawY1-13, xWindow+drawX2+13, yWindow+drawY1+13)

overLeftHand = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow+drawX2-13, yWindow+drawY2-13, xWindow+drawX2+13, yWindow+drawY2+13)
overRightHand = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow+drawX1-13, yWindow+drawY2-13, xWindow+drawX1+13, yWindow+drawY2+13)
overPants = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow+drawX2-13, yWindow+drawY3-13, xWindow+drawX2+13, yWindow+drawY3+13)
overPet = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow+drawX1-13, yWindow+drawY3-13, xWindow+drawX1+13, yWindow+drawY3+13)


lookingItem = noone

with myHat {overItem = false}
with myPants {overItem = false}
with myShirt {overItem = false}
with myRightHand {overItem = false}
with myLeftHand {overItem = false}
with myPet {overItem = false}

if selected
    {
    if overHat and myHat.itemName != "none" 
        lookingItem = myHat
    if overShirt and myShirt.itemName != "none" 
        lookingItem = myShirt
    if overPants and myPants.itemName != "none" 
        lookingItem = myPants
    if overRightHand and myRightHand.itemName != "none" 
        lookingItem = myRightHand
    if overLeftHand and myLeftHand.itemName != "none" 
        lookingItem = myLeftHand
    if overPet and myPet.itemName != "none" 
        lookingItem = myPet
    }

if lookingItem != noone
    {
    canLookItem = true
    with ItemParent
        if selected == true
            other.canLookItem = false
    if canLookItem    
        lookingItem.overItem = true
    }

/* */
///Select

overSprite = drawable and point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), Ship.drawTagX + drawTagPictureX, Ship.drawTagY + drawTagPictureY + myTagPlace + tagShift, Ship.drawTagX + drawTagPictureX + drawTagPictureWidth, Ship.drawTagY + drawTagPictureY + myTagPlace + drawTagPictureHeight + tagShift + 15)
overButton = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xReal, yReal, xReal + realWidth, yReal + realHeight) and !global.itemSelected

if mouse_check_button_pressed(mb_left) and !instance_exists(DumpItem) and __view_get( e__VW.XView, 0 ) = 0
    {
    //Select from ship
    if (overButton and mySlot.myLayer = global.menuShipLayer) and (!global.inPort or Ship.portSelect)
        {
        while ds_list_find_index(global.crewList, id) - global.slotPosition > 3 or ds_list_find_index(global.crewList, id) - global.slotPosition < 0
            {
            if ds_list_find_index(global.crewList, id) - global.slotPosition < 0
                {
                global.slotPosition --
                }
            else if ds_list_find_index(global.crewList, id) - global.slotPosition > 3
                {
                global.slotPosition ++
                } 
            }
        event_user(1)
        }
    //select from banner
    else if overSprite
        {
        if global.doubleClickTimer > 0
            {
            if selected = true
                global.menuShipLayer = mySlot.myLayer
            if global.inPort = true 
                {
                with DrawPort
                    portSelect = false
                Ship.portSelect = true
                }
            }
        else
            {
            event_user(1)
            }
        }
    }
    


 

/* */
///Dump Pirate

dumpX = Ship.drawTagX + 54
dumpY = Ship.drawTagY + myTagPlace + tagShift + 9
overDump = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), dumpX + 3, dumpY + 3, dumpX+realWidth-5, dumpY+realHeight-5)

if selected
    {
    if overDump and !instance_exists(DumpItem)
        {
        if mouse_check_button_pressed(mb_left) 
            with instance_create(0,0,DumpItem)
                {
				retire = false	
				if !global.inPort
					caption = "Do you want to make " + other.name + " walk the plank?"
                else{
					if global.portType == 1{
						caption = "Do you want to retire " + other.name + "?"
						retire = true
					}
					else
						caption = "Do you maroon " + other.name + " on this island?"
				}
				
				myEvent = 1
                myDump = other.id
                }
        }
    }

/* */
/*  */
}

stars = 0
if myAction[0] != noone and myAction[0] != LostEyeAction
    stars ++
if myAction[1] != noone and myAction[1] != LostEyeAction
    stars ++
if myAction[2] != noone and myAction[2] != LostEyeAction
    stars ++   
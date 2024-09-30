/// @description Rock

drawX = room_width/2 + 30 - shipMapX*!global.inPort - 25*(instance_exists(Event))*!global.inPort - (global.inPort * 200) - 10*(instance_exists(CombatRunner)) 

//map adjust
if !MapCreator.mapClose
    shipMapX += min(10, shipMapXMax - shipMapX)
else
    shipMapX -= min(5, shipMapX)
    
if instance_exists(Event)
    shipMapX = 0

if rockSpeed > 0
    {
    if rockRotation > rockTo
        {
        rockTo = -irandom_range(5,10)
        rockSpeed = -random_range(0.2,0.3) * power(rockScale, 2) / 2
        }
    }
else
    {
    if rockRotation < rockTo
        {
        rockTo = irandom_range(5,10)
        rockSpeed = random_range(0.1,0.2) * rockScale / 2
        }
    }
    
rockRotation += rockSpeed * global.gameSpeed
//waveHeight = sin(2*pi*(waveShipx)/(background_get_width(WaveShip)*1/(rockScale)))*12.5 + damage*5

realRock = GetWaterAngle(middleWaves, drawX)

///Animate Flag

///Change Menu Layer

overUp = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow + buttonX, yWindow + buttonY, 15)
overDown = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow + sprite_width - buttonX, yWindow + buttonY, 15)

if overDown and mouse_check_button_pressed(mb_left) and global.menuShipLayer < 2 and __view_get( e__VW.XView, 0 ) = 0 and !instance_exists(DumpItem)
    {
    global.menuShipLayer += 1
    }
    
if overUp and mouse_check_button_pressed(mb_left) and global.menuShipLayer > 0 and __view_get( e__VW.XView, 0 ) = 0 and !instance_exists(DumpItem)
    {
    global.menuShipLayer -= 1
    }
    

///Change Slot Position

if mouse_check_button_pressed(mb_left) and __view_get( e__VW.XView, 0 ) = 0  and !instance_exists(DumpItem)
    {
    if overListUp and global.slotPosition > 0
        {
        global.slotPosition --
        }
        
    if overListDown and global.slotPosition + drawPiratePostNumber < ds_list_size(global.crewList) and window_view_mouse_get_x(0) < 55
        {
        global.slotPosition ++
        }
    }
    
if global.slotPosition + drawPiratePostNumber > global.crewSize and global.crewSize > drawPiratePostNumber - 1
    {
    global.slotPosition --
    }

overListUp = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawTagX + listPositionX - 8, drawTagY + listPositionUpY - 15, drawTagX + listPositionX + 8, drawTagY + listPositionUpY + 15)
overListDown = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawTagX + listPositionX - 8, drawTagY + listPositionDownY - 15, drawTagX + listPositionX + 8, drawTagY + listPositionDownY + 15)

///Global Stats

global.totalSailBonus = 0
global.totalWheelBonus = 0
global.totalRiggingBonus = 0
global.totalSwordBonus = 0
global.totalGunBonus = 0
global.totalCannonBonus = 0
global.totalMedicalBonus = 0

for(i=0; i<instance_number(Pirate); i++)
    {
    checkPirate = instance_find(Pirate, i)
    checkPirateSlot = checkPirate.mySlot
    
    if checkPirate.stunned == false
        {
        global.totalSwordBonus += checkPirate.statTotal[0]
        global.totalGunBonus += checkPirate.statTotal[1]
        
        if checkPirateSlot.slotType = "cannon" and checkPirateSlot.damaged == false
            {
            global.totalCannonBonus += checkPirate.statTotal[2]
            global.totalCannonBonus ++
            }
            
        if checkPirateSlot.slotType = "sail" and checkPirateSlot.damaged == false
            {
            global.totalSailBonus += checkPirate.statTotal[4]
            global.totalSailBonus ++
            }
            
        if checkPirateSlot.slotType = "wheel" and checkPirateSlot.damaged == false
            {
            global.totalWheelBonus += checkPirate.statTotal[5]
            global.totalWheelBonus ++
            }
            
        if checkPirateSlot.slotType = "rigging" and checkPirateSlot.damaged == false
            {
            global.totalRiggingBonus += checkPirate.statTotal[3]
            global.totalRiggingBonus ++
            }
		//deck rope item
		else if checkPirate.myPet.itemPower == "medical"{
			global.totalRiggingBonus += checkPirate.statTotal[3]
		}
        if checkPirateSlot.slotType = "medical" and checkPirateSlot.damaged == false
            {
            global.totalMedicalBonus += checkPirate.statTotal[6]
            global.totalMedicalBonus ++
            }
		//medical item (bandages)
		if checkPirate.myPet.itemPower == "medical"
			global.totalMedicalBonus ++
		//wheel item (lookout)
		if checkPirate.myPet.itemPower == "wheel"
			global.totalWheelBonus ++
		//wheel item (lookout)
		if checkPirate.myPet.itemPower == "rigging"
			global.totalRiggingBonus ++
        }
    }
    
myStatsNumList[3] = global.totalRiggingBonus
myStatsNumList[4] = global.totalSailBonus
myStatsNumList[5] = global.totalWheelBonus
myStatsNumList[0] = global.totalSwordBonus
myStatsNumList[1] = global.totalGunBonus
myStatsNumList[2] = global.totalCannonBonus
myStatsNumList[6] = global.totalMedicalBonus

for(i=0; i<4; i++){
    global.pirateNum[i] = 0
    with Pirate{
        if myMainPer = other.i
            global.pirateNum[other.i] ++
        }
    }

///In Port

if global.inPort = true
    drawY = room_height/2 + 50 + drawPortShiftY
else
    drawY = room_height/2 + 50

rockScale = 0.1

shipSize = 1 + overShipPort*0.1


overShipPort = global.inPort and point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawX, drawY-sprite_get_height(hullDict[shipType])/2, 50)

if global.inPort = true and mouse_check_button_released(mb_left)  and !instance_exists(DumpItem)
    {
    if overShipPort
        portSelect = true
    }
        
            
//UpdateHealthDiff
if myHealth < 0
    myHealth = 0
if abs(healthDiff - myHealth) > 1
    {
    if !updateHealthDiff
        healthDiffTimer ++
        
    if instance_exists(Pirate)
        if healthDiffTimer > room_speed*Pirate.healthTimer
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


///Pirate Selected Tracker

///Double Click Controller

if mouse_check_button_pressed(mb_left)
    {
    if global.doubleClickTimer == 0
        global.doubleClickTimer = doubleClickTimerLength 
    else
        global.doubleClickTimer = 0
    
    doubleClickX = window_view_mouse_get_x(0)
    doubleClickY = window_view_mouse_get_y(0)
    }

if global.doubleClickTimer > 0
    global.doubleClickTimer -= 1
    
if point_distance(doubleClickX, doubleClickY, window_view_mouse_get_x(0), window_view_mouse_get_y(0)) > 10
     global.doubleClickTimer = 0


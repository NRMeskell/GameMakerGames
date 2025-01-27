/// @description Do Time Cycle

global.timeCycleRate = 0
if room == GameRoom{
    if (instance_exists(Defeat) or instance_exists(ConquerPannel) or instance_exists(PirateLeveler) or (ds_list_size(global.notificationList) > 0) or global.mapPause or (global.eventOpen) or (instance_exists(Store) and !global.inPort) or ds_list_size(ItemRunner.floatingItems) != 0 or instance_exists(CombatRunner))
        alarm[1] = 1
        
    if (alarm[1] <= 0 and MapShip.path_position < 1) or (global.inPort and global.portType == 1)
        global.doTime = true
    else
        global.doTime = false
    }
else
    global.doTime = true
    
if global.doTime and !(global.inPort and global.portType != 1)
    {
    global.timeCycle += timeSpeed
	global.timeCycleRate = 1
    }
	
if alarm[2] > 0{
	if !MapCreator.instantClose{
		global.timeCycle += timeSpeed * campingSpeed * pi/2*sin(alarm[2]/(campTime) * pi)
		global.timeCycleRate = campingSpeed * pi/2*sin(alarm[2]/(campTime) * pi)
		
		with Cloud
			x += moveSpeed*2*(other.timeSpeed * other.campingSpeed * pi/2*sin(other.alarm[2]/(other.campTime) * pi))
		with Pirate
			myHealth += 0.5*(other.timeSpeed * other.campingSpeed * pi/2*sin(other.alarm[2]/(other.campTime) * pi)) * sqrt(global.totalMedicalBonus)*Ship.healSpeed
	}
	else
		alarm[2] += 1
}

if global.timeCycle > global.timeCycleLength
    {
    global.timeCycle = 0
	MoonLight.image_index = (MoonLight.image_index + 1) % sprite_get_number(MoonSpr)
    }
    
    
if (global.timeCycle/(global.timeCycleLength) * 360) > 180 and global.isDay = true
    global.isDay = false
    
if (global.timeCycle/(global.timeCycleLength) * 360) < 180 and global.isDay = false
    global.isDay = true

    




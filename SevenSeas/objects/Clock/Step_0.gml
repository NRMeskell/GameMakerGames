/// @description Do Time Cycle

if room == GameRoom{
    if eventTimeLeft > 0 or (instance_exists(Defeat) or instance_exists(ConquerPannel) or instance_exists(PirateLeveler) or (ds_list_size(global.notificationList) > 0) or global.mapPause or (global.eventOpen) or (instance_exists(Store) and !global.inPort) or ds_list_size(ItemRunner.floatingItems) != 0 or instance_exists(CombatRunner))
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
    global.timeCycle += (global.inPort or room != GameRoom ? 1 : global.gameRate )
    }
	
if eventTimeLeft > 0{
	if !ds_list_size(global.notificationList){
		repeat(min(eventTimeLeft, 1+4*global.skipCamp)){
			global.timeCycle += campingSpeed * pi/2*sin(eventTimeLeft/(eventTimeTotal) * pi)

			with Cloud{
				x += moveSpeed*2*(other.campingSpeed * pi/2*sin(other.eventTimeLeft/(other.eventTimeTotal) * pi))
			}
			
			eventTimeLeft -= 1
		}
	}
}
if eventTimeLeft == 0{
	with waitCaller
		script_execute(Clock.waitEvent, Clock.waitSuccess)
	eventTimeLeft = -1
	closeEventCode()
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






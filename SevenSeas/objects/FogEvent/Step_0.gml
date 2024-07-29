/// @description Turn Around

if direction > 90 and direction < 270
    image_xscale = -1
else
    image_xscale = 1
    
if !floatAway{
    image_alpha = abs(sin((current_time+alphaShift)/10000))
}
else{
	image_alpha -= 0.01
}

if ds_list_size(global.notificationList) > 0 and alarm[0] > 0
	alarm[0] ++

if alarm[0] > 0{
	if ds_list_size(global.notificationList) < 1{
		global.timeCycle += 5*pi/2*sin(alarm[0]/(room_speed*2) * pi)
		global.timeCycleRate = 5*pi/2*sin(alarm[0]/(room_speed*2) * pi)
		with Cloud
			x += 3*moveSpeed*2*(pi/2*sin(other.alarm[0]/(room_speed*2) * pi))
	}
	else{
		alarm[0] += 1
	}
}
 

/// @description Insert description here
// You can write your code in this editor

event_inherited()

if irandom(room_speed*30) == 0{
	event_user(2)
}
	
if !pickedUp{
	image_speed = 1
	if state != "sleeping"{
		if ds_list_size(catPath) > 0{
			var nextPoint = ds_list_find_value(catPath, 0)
			walkDir = sign(nextPoint.pointX - x)
	
			canStep = false
			// Try walking
			if y = myGround.y and walkDir != 0 and collision_line(x+walkDir*sprite_get_width(MooseSittingSpr)/3 + walkDir*spd, y-1, x+walkDir*sprite_get_width(MooseSittingSpr)/3 + walkDir*spd, y+5, myGround, false, true){
				if chase{
					state = "chasing"
					spd = runSpeed
				}
				else{	
					if !menace{
						state = "walking"
						spd = walkSpeed
					}else{
						image_speed = 0.75
						state = "stalking"
						spd = stalkSpeed
					}
				}
				x += walkDir*min(spd, abs(nextPoint.pointX - x))
				alarm[1] = room_speed/(2*(2*chase+1))
				depth =  myGround.depth
			}
			else if alarm[1] <= 0{
				// try Jumping
				if (y != nextPoint.pointY) or (x != nextPoint.pointX) {
					myGround = nextPoint.platform
					
					var jumpPlat = nextPoint.platform;
					with jumpPlat{
						other.jumpP = NearestSurface(other.x, 0, false)
					}
					x += min(runSpeed*(1+0.5*chase), abs(jumpP.pointX - x)) * dcos(point_direction(x,y, jumpP.pointX, jumpP.pointY))
					y -= min(runSpeed*(1+0.5*chase), abs(jumpP.pointY - y)) * dsin(point_direction(x,y, jumpP.pointX, jumpP.pointY))
					if point_distance(x,y, jumpP.pointX, jumpP.pointY) > 5{
						state = "jumping"
						image_index = 4+sign(dsin(point_direction(x, y, jumpP.pointX, jumpP.pointY)))*power(dsin(point_direction(x, y, jumpP.pointX, jumpP.pointY)), 2)*4
					
						if myGround.depth != jumpP.platform.depth
							depth = min(myGround.depth, jumpP.platform.depth) -3
					}
				}
		
			}
			if y==nextPoint.pointY and x == nextPoint.pointX {
				myGround = nextPoint.platform
				y = myGround.y
				depth = myGround.depth
				ds_list_delete(catPath, 0)
			}
		}
		if prevPos[0]==x and prevPos[1]==y{
			state = "sitting"
			image_index = 0
		}
	}
}
else{
	if pickedUp{
		/*if ((current_time div (1000/room_speed)) mod (room_speed*3) == 0) and (irandom(3) < menaceTimer)
			event_user(1)*/
		state = "held"
	}
}
prevPos = [x, y]

if menaceTimer == 5{
	menace = true
}
if menaceTimer <=3{
	menace = false
}


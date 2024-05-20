/// @description Bring ball

with myCharacter.myMarker{
    x = other.x
    y = other.y
	alarm[0] = room_speed/2
    event_user(0) //move to nice location
	if other.image_index == 3
		teleport = true
    }
    
with myCharacter{	
    golfHitting = false
    golfSwinging = false
    golfStrike = false
    instance_destroy(myClub)
	if other.image_index == 1{
		with other
			event_user(4)
		}
    }
    
instance_destroy()



/// @description Knock Over


if phy_speed > 2 {
	myBounceSnd = RockBounceSound
	event_user(2)
	
    with other.myCharacter
        {
		if instance_exists(myClub)
			with myClub
				event_user(0)
		if instance_exists(myMarker)
			myMarker.alarm[0] = room_speed/2
        stunned = true
        alarm[5] = room_speed/global.timeDiff * other.phy_speed
        with body
            {
            physics_apply_impulse(x,y,0,-0.2*sqrt(global.timeDiff))
            }
        }
}

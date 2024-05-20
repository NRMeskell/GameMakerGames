/// @description Kicked

kicker = other.myCharacter

if phy_speed < 2
    {
    myTargetId = -1
    targetDistance = 1024
    for(i=0; i< instance_number(CharacterBody); i++)
        {
        target = instance_find(CharacterBody, i)
        if target != kicker.body
            if point_distance(target.x, target.y, x, y) < targetDistance and (sign(kicker.body.x - x) != sign(target.x - x))
                {
                myTargetId = target
                targetDistance = point_distance(target.x, target.y, x, y)
                }
        }
		
    if myTargetId != -1
        {
        angle = point_direction(x, y, myTargetId.myCharacter.head.x, myTargetId.myCharacter.head.y - point_distance(x,y, myTargetId.myCharacter.head.x, myTargetId.myCharacter.head.y)*0.2)
        if min(abs(angle), abs(180-angle), abs(360-angle)) < 45{
		
			checkKicker = instance_place(phy_position_x, phy_position_y, CharacterCollider)
			while checkKicker != noone{
				if checkKicker.myCharacter == kicker{
					phy_position_x += 5*dcos(angle)
					phy_position_y -= 5*dsin(angle)
				}else{
					break;
				}
				checkKicker = instance_place(phy_position_x, phy_position_y, CharacterCollider)
			}
			
			kickSpeed = min(4*kicker.body.phy_speed + 4*super, 12 + 8*super)
			physics_apply_impulse(phy_position_x, phy_position_y, cos(degtorad(angle))*kickSpeed*sqrt(global.timeDiff), sin(degtorad(angle))*kickSpeed*sqrt(global.timeDiff))
			}
	}
}


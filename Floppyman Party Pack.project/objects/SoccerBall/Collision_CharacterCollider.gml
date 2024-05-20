/// @description Kicked

if phy_speed < 2
    {
    myTargetId = -1
    targetDistance = 1024
    for(i=0; i< instance_number(CharacterBody); i++)
        {
        target = instance_find(CharacterBody, i)
        if target.id != other.myCharacter.body.id 
            if (sign(x - other.myCharacter.body.x) != sign(x - target.x)) and (sin(degtorad(point_direction(x, y, target.x, target.y))) < .5)
                if point_distance(target.x, target.y, x, y) < targetDistance
                    {
                    myTargetId = target.id
                    targetDistance = point_distance(target.x, target.y, x, y)
                    }
        }
    if myTargetId != -1
        {
        highPoint = room_height
        for(i=0; i<array_length_1d(myTargetId.myCharacter.bodyPart); i++)
            with myTargetId.myCharacter.bodyPart[i]
                if y < other.highPoint 
                    other.highPoint = y
                
        angle = point_direction(x, y, myTargetId.myCharacter.head.x, highPoint - point_distance(x,0, myTargetId.myCharacter.head.x, 0)*0.2)
        physics_apply_impulse(x, y, cos(degtorad(angle))*15*sqrt(global.timeDiff), sin(degtorad(angle))*15*sqrt(global.timeDiff))
        }
    }


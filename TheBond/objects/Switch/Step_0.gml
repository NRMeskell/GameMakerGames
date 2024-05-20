/// @description Flip Switch

cloudSize = 10

if place_meeting(x,y,SpiritParent) and switchable
    {
    for(i=0; i<array_length(target); i++)
        {
        if (target[i].object_index == ClosedBlackDoor) or (target[i].object_index == BlackDoor)
            {
            if target[i].object_index == ClosedBlackDoor
                newDoor[i] = instance_create(target[i].x, target[i].y, BlackDoor)
            else
                newDoor[i] = instance_create(target[i].x, target[i].y, ClosedBlackDoor)            
                
            color[0] = c_gray
            color[1] = c_dkgray
            }
            
        else if target[i].object_index == ClosedWhiteDoor or target[i].object_index == WhiteDoor 
            {
            if target[i].object_index == ClosedWhiteDoor
                newDoor[i] = instance_create(target[i].x, target[i].y, WhiteDoor)
            else
                newDoor[i] = instance_create(target[i].x, target[i].y, ClosedWhiteDoor)
                
            color[0] = c_ltgray
            color[1] = c_white
            }
            
        else if target[i].object_index == ClosedAllDoor or target[i].object_index == AllDoor
            {
            if target[i].object_index == ClosedAllDoor
                newDoor[i] = instance_create(target[i].x, target[i].y, AllDoor)
            else
                newDoor[i] = instance_create(target[i].x, target[i].y, ClosedAllDoor)
                
            color[0] = c_ltgray
            color[1] = c_gray
            }
            
        for(m=0; m < cloudSize; m++)
            {
            with instance_create(x+irandom_range(-10,10)+8, y+irandom_range(-10,10)+8, Cloud)
                {
                image_blend = choose(other.color[0], other.color[1])
                image_index = 2+irandom(2)
                shrinkSpeed = 8
                image_speed = 0
                image_angle = choose(0,90,180,270)
                move_towards_point(other.x+8, other.y+8, -1)
                depth = -10
                }
            with instance_create(target[i].x+irandom_range(-10,10)+8, target[i].y+irandom_range(-10,10)+8, Cloud)
                {
                image_blend = choose(other.color[0], other.color[1])
                image_index = 2+irandom(2)
                shrinkSpeed = 8
                image_speed = 0
                image_angle = choose(0,90,180,270)
                move_towards_point(other.target[other.i].x+8, other.target[other.i].y+8, -1)
                depth = -10
                }
            }
        } 
        
    for(i=0; i<array_length_1d(target); i++)
        {
        with Switch
            {
            if id != other.id
                for (r=0; r<array_length_1d(target); r++)
                    {
                    if target[r] == other.target[other.i]
                        target[r] = other.newDoor[other.i]
                    }
            }
        with Button
            {
            if id != other.id
                for (r=0; r<array_length(target); r++)
                    {
                    if target[r] == other.target[other.i]
                        target[r] = other.newDoor[other.i]
                    }
            }
        instance_destroy(target[i])
        target[i] = newDoor[i]
        }
        
    image_index = 1 - image_index
    audio_play_sound(LeverSnd, 1, false)
    switchable = false
    }

if !place_meeting(x,y,SpiritParent)
    switchable = true


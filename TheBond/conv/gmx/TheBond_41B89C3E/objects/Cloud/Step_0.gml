/// @description Shrink

image_index += shrinkSpeed/room_speed

if image_index > image_number - 1
    instance_destroy()
    
nearSoulTrap = instance_nearest(x,y,SoulTrap)
if nearSoulTrap
    if point_distance(x,y,nearSoulTrap.x+8, nearSoulTrap.y+8) < 5
        {
        with nearSoulTrap 
            {
            if !instance_exists(WhiteSpirit) and hit and image_index < (image_number -1)
                {
                image_index +=  cloudStep
                }
            }
        instance_destroy()
        }
       
if place_meeting(x,y,SpiritParent)
    depth = 1


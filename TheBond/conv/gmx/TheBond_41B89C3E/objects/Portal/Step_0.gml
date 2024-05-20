/// @description Portal

if !place_meeting(x,y,SpiritParent)
    portalActive = true
else
    {
    if portalActive = true
        {
        target.portalActive = false
        
        with instance_nearest(x,y,SpiritParent)
            {
            x = other.target.x + 8
            y = other.target.y + 8
            }
            
        for(m=0; m < 10; m++)
                {
                with instance_create(x+irandom_range(-10,10)+8, y+irandom_range(-10,10)+8, Cloud)
                    {
                    image_blend = choose(c_ltgray, c_gray, c_dkgray, c_white)
                    image_index = 2+irandom(2)
                    shrinkSpeed = 8
                    image_speed = 0
                    image_angle = choose(0,90,180,270)
                    move_towards_point(other.x+8, other.y+8, -1)
                    depth = -10
                    //sprite_index = SparkleSpr
                    }
                with instance_create(target.x+irandom_range(-10,10)+8, target.y+irandom_range(-10,10)+8, Cloud)
                    {
                    image_blend = choose(c_ltgray, c_gray, c_dkgray, c_white)
                    image_index = 2+irandom(2)
                    shrinkSpeed = 8
                    image_speed = 0
                    image_angle = choose(0,90,180,270)
                    move_towards_point(other.target.x+8, other.target.y+8, -1)
                    depth = -10
                    //sprite_index = SparkleSpr
                    }
                }
                
        audio_play_sound(TeleportSnd, 1, false)
        }
    portalActive = false
    }


/// @description Hit Spirit

if instance_exists(WhiteSpirit)
if HittingPath()
    {
    complete = false
    snd = audio_play_sound(SuckSnd, 1, false)
    audio_sound_gain(snd, 2, 1)
    snd = audio_play_sound(Suck2Snd, 1, false)
    audio_sound_gain(snd, 2, 1)
    
    cloudStep = (image_number - 1) / (instance_number(Cloud) * 0.75) 
    
    hit = true
    with WhiteSpirit
        {
        for(i=0; i<10; i++)
            with instance_create(x+irandom_range(-10,10), y+irandom_range(-10,10), Cloud)
                {
                image_blend = choose(c_white, c_ltgray)
                image_index = irandom(4)
                shrinkSpeed = 8
                image_speed = 0
                image_angle = choose(0,90,180,270)
                sprite_index = SparkleSpr
                }
                
        for(i=0; i<15; i++)
            {
            cloudDistance = random(1)
            createX = cos(degtorad(point_direction(x,y,BlackSpirit.x, BlackSpirit.y)))*point_distance(x,y,BlackSpirit.x, BlackSpirit.y)*cloudDistance
            createY = -sin(degtorad(point_direction(x,y,BlackSpirit.x, BlackSpirit.y)))*point_distance(x,y,BlackSpirit.x, BlackSpirit.y)*cloudDistance

            with instance_create(x+createX, y+createY, Cloud)
                {
                image_blend = merge_color(c_white, c_black, other.cloudDistance)
                image_index = 4 + irandom(1)
                shrinkSpeed = 4
                image_speed = 0
                image_angle = choose(0,90,180,270)
                sprite_index = SparkleSpr
                }
            }
        instance_destroy()
        }
        
    with BlackSpirit
        {
        for(i=0; i<10; i++)
            with instance_create(x+irandom_range(-10,10), y+irandom_range(-10,10), Cloud)
                {
                image_blend = choose(c_black, c_gray)
                image_index = irandom(4)
                shrinkSpeed = 8
                image_speed = 0
                image_angle = choose(0,90,180,270)
                sprite_index = SparkleSpr
                }
        instance_destroy()
        }
        
    with Cloud
        {
        move_towards_point(other.x+8, other.y+8, 2*point_distance(x,y,other.x+8,other.y+8)/room_speed)
        shrinkSpeed = 2*point_distance(x,y,other.x+8,other.y+8)/room_speed
        }
        
    }
    
if image_index >= (image_number - 1)
    {
    if !complete
        {
        complete = true
        alarm[0] = room_speed
        }
    }

///Cloud Sucking

if irandom(40) = 0 and image_index =0 
    {
    with instance_create(x+irandom_range(-20,20)+8, y+irandom_range(-20,20)+8, Cloud)
        {
        image_blend = choose(c_ltgray, c_gray, c_dkgray)
        image_index = 3+irandom(2)
        shrinkSpeed = 8
        image_speed = 0
        image_angle = choose(0,90,180,270)
        move_towards_point(other.x+8, other.y+8, 0.5)
        depth = 0
        sprite_index = SparkleSpr
        }
    }


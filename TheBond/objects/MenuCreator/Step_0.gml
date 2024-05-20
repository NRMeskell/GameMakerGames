/// @description Create Clouds

if irandom(30) = 0
    {
    with instance_create(irandom(room_width), irandom(room_height), Cloud)
        {
        image_blend = choose(c_black, c_dkgray, c_gray, c_ltgray, c_white)
        image_index = irandom(4)
        shrinkSpeed = 8
        image_speed = 0
        image_angle = choose(0,90,180,270)
        depth = 0
        }
    }


/// @description TEMP

if irandom(10) == 3
if image_index != 11
{
Direction = choose(1,2,3,4)

if Direction = 1
    {
    Height = random_range(288, room_height)
    instance_create(-32, Height, Ooze)
    }
    
if Direction = 2 or Direction = 3
    {
    Width = random_range(200, room_width-200)
    instance_create(Width, room_height + 32, Ooze)
    }
    
if Direction = 4
    {
    Height = random_range(288, room_height)
    instance_create(room_width + 32, Height, Ooze)
    }
}


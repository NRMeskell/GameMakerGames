/// @description Button


//if !instance_exists(OptionMenu) or (image_index >= 12 and image_index <= 16 or image_index > 20) 
{
if distance_to_point(mouse_x, mouse_y) < 1 and ButtonReady = true
    {
    image_blend = c_gray
    }
else
    {
    image_blend = c_white
    }
    
if image_index > 19 and image_index < 23 and !file_exists("savegame")
    image_blend = c_gray
}


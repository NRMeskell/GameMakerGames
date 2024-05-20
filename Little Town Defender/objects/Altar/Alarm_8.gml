/// @description Gold Leave

instance_create(x,y,GoldDing)

GoldDinging +=1 

if GoldDinging = 3
    {
    if image_index = 6
        image_index = 8
    if image_index > 7 and image_index < image_number-1
        image_index += 1
        
    GoldDinging = 0
    
    if image_index = image_number - 1
        {
        global.BribedDone = true
        }
    }
    
alarm[8] = room_speed
        



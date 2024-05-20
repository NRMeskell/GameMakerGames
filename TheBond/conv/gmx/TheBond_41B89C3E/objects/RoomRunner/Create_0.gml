/// @description Create Ground

for(i=-24; i<(room_width+24) div 16+1; i+=1)
    for(r=0; r<(room_height + 25) div 16+1; r+=1)
        with instance_create(i*16-12, r*16-12, GroundTile)
            {
            if place_meeting(x,y,WaterPatch){
                sprite_index = WaterDeadSpr
                depth = 20 + irandom(10)
                if !place_meeting(x,y-16,WaterPatch)
                    image_index = 0
                else
                    image_index = irandom_range(1, 2)
                }
            else if place_meeting(x,y,GrassPatch){
                sprite_index = GrassDeadSpr
                image_index = irandom(image_number-1)
                }
            else if place_meeting(x,y,StonePatch){
                sprite_index = StoneDeadSpr
                image_index = irandom(image_number-1)
                }
            else{
                sprite_index = GroundDeadSpr
                image_index = irandom(image_number-1)
            }
            image_speed = 0
            depth = irandom(10)+10
            }

///Water Texture Scrolling

waterTop1 = -48
waterLeft1 = -48
waterTop2 = room_height
waterLeft2 = -48

waterSpeed = 16/room_speed


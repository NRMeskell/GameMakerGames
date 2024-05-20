/// @description Draw Water

depth = 1000

draw_set_color(c_ltgray)
draw_rectangle(0,0, room_width, room_height, false)
draw_set_color(c_black)

if instance_exists(RainbowSpirit){
    waterLeft1 += waterSpeed
    waterLeft2 += waterSpeed*0.75
    waterTop1 += waterSpeed*0.25
    waterTop2 -= waterSpeed*0.15
    
    if waterLeft1 >= 0
        waterLeft1 = -48
    if waterTop1 >= 0
        waterTop1 = -48
    if waterLeft2 >= 0
        waterLeft2 = -48
    if waterTop2 >= room_height-48
        waterTop2 = room_height
        
    for(w=waterLeft1; w<room_width; w+= 48)
        for(h=waterTop1; h<room_height; h+= 48)
            draw_sprite(WaterSpr, 0, w, h)
            
    for(w=waterLeft2; w<room_width; w+= 48)
        for(h=waterTop2; h>0; h-=48)
            draw_sprite_ext(WaterSpr, 0, w, h, 1, 1, 0, c_white, 0.5)
}


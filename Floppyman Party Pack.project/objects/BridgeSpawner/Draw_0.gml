/// @description Draw Water

waterPos += waterSpeed

if waterPos > sprite_get_width(WaterSpr)
    waterPos = 0

for(i=room_width/2-400 + waterPos; i<room_width/2 + 200; i+=sprite_get_width(WaterSpr)){
    draw_sprite_ext(WaterSpr, 0, i, room_height-20, 1, 0.75, 0, c_white, 1)
}


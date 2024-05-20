/// @description Draw Water

waterPos += waterSpeed

if waterPos > sprite_get_width(WaterSpr)
    waterPos = 0

for(i=-sprite_get_width(WaterSpr) + waterPos; i<room_width; i+=sprite_get_width(WaterSpr)){
    draw_sprite_ext(WaterSpr, 0, i, room_height-100, 1, 1, 0, c_white, 1)
}


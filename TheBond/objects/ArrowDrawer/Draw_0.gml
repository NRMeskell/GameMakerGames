/// @description Draw Arrows

if whiteDrawAlpha > 0
    draw_sprite_ext(ArrowSpr, 1, room_width/2 + drawWidth, drawHeight, 1, 1, 0, c_white, whiteDrawAlpha)

if blackDrawAlpha > 0
    draw_sprite_ext(ArrowSpr, 0, room_width/2 - drawWidth, drawHeight, 1, 1, 0, c_white, blackDrawAlpha)


/// @description Draw Connection

draw_sprite_ext(WhiteSpiritSpr, shadeImage div 1, x, y, image_xscale, 1, 0, c_white, 1)
draw_sprite_ext(SpiritShadeSpr, shadeImage div 1, x, y, image_xscale, 1, 0, c_gray, 1)
draw_sprite_ext(SpiritShadeSpr, (shadeImage + 3 * 2) div 1, x, y, image_xscale, 1, 0, c_gray, 0.7)


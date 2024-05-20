/// @description Draw Screenshot

if room = Pause
{
Scale = room_width / sprite_get_width(global.SaveScreen)

draw_sprite_ext(global.SaveScreen, 0, 0, -5, Scale, Scale, 0, c_white, 0.7)
}


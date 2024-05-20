/// @description Draw Time

draw_self()

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_set_font(CaptionFont)

HoursStr = string_format(Hours, 2, 0);
MinutesStr = string_format(Minutes, 2, 0);
SecondStr = string_format(Seconds, 2, 0);

HoursShow = string_replace(HoursStr," ","0")
MinutesShow = string_replace(MinutesStr," ","0")
SecondsShow = string_replace(SecondStr," ","0")

draw_text(x, y, string_hash_to_newline(string(HoursShow) + ":" + string(MinutesShow) + ":" + string(SecondsShow)))



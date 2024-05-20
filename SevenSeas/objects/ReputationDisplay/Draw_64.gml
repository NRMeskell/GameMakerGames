/// @description Draw Self
// You can write your code in this editor

//draw_sprite(ReputationSpr, 0, x, y)

draw_set_halign(fa_right)
draw_set_valign(fa_center)
draw_set_font(global.LargePirateFont)
draw_set_color(merge_color(c_gray, c_black, 0.2))
draw_text(x - 30, y, repType)

if amount >= 0{
    addOn = "+"
    draw_set_color(merge_color(c_green, c_black, 0.1))
    }
else{
    addOn = "-"
    draw_set_color(merge_color(c_red, c_black, 0.1))
    }
	
draw_text(x-5, y, addOn + string(abs(amount)))
draw_set_font(global.PirateFont)
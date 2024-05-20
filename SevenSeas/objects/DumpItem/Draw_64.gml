/// @description Close Notifacation

draw_set_color(c_black)
draw_set_font(global.PirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_sprite_part(NotifacationSpr, 0, 0, 0, sprite_get_width(NotifacationSpr), animationBorder + 20, drawX - sprite_get_width(NotifacationSpr)/2, drawY - notificationSize/2 - animationBorder - 20)
draw_sprite_part(NotifacationSpr, 0, 0, animationBorder + 20, sprite_get_width(NotifacationSpr), notificationSize, drawX - sprite_get_width(NotifacationSpr)/2, drawY - notificationSize/2)
draw_sprite_part(NotifacationSpr, 0, 0, sprite_get_height(NotifacationSpr) - 20 - animationBorder, sprite_get_width(NotifacationSpr), 20 + animationBorder, drawX - sprite_get_width(NotifacationSpr)/2, drawY + notificationSize/2)

draw_text_ext_transformed(drawX, drawY - notificationSize/2 + captionSize/2, string_hash_to_newline(caption), 12, sprite_get_width(NotifacationSpr) - 40 - animationBorder*2, 1, 1, 0)

//draw_text_ext(drawX, drawY + captionSize/2 + 5, ds_list_find_value(global.notificationList, 1), 12, sprite_get_width(NotifacationSpr)-40)

if onButtonLeft
    draw_sprite(ButtonSpr, 7, drawX - buttonShift, drawY + notificationSize/2 + 20)
else
    draw_sprite(ButtonSpr, 6, drawX - buttonShift, drawY + notificationSize/2 + 20)

if onButtonRight
    draw_sprite(ButtonSpr, 9, drawX + buttonShift, drawY + notificationSize/2 + 20)
else
    draw_sprite(ButtonSpr, 8, drawX + buttonShift, drawY + notificationSize/2 + 20)
    
    
draw_text(drawX - buttonShift, drawY + notificationSize/2 + 20, string_hash_to_newline("aye"))
draw_text(drawX + buttonShift, drawY + notificationSize/2 + 20, string_hash_to_newline("nay"))


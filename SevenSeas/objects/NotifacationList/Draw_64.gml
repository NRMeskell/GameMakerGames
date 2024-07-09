/// @description Close Notifacation

if ds_list_size(global.notificationList) > 0 and !instance_exists(EnemyAttack)
    {
    draw_set_color(make_color_rgb(149, 126, 1))
    draw_set_font(global.LargePirateFont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    
    draw_sprite_part(NotifacationSpr, 0, 0, 0, sprite_get_width(NotifacationSpr), animationBorder + 20, drawX - sprite_get_width(NotifacationSpr)/2, drawY - notificationSize/2 - animationBorder - 20)
    draw_sprite_part(NotifacationSpr, 0, 0, animationBorder + 20, sprite_get_width(NotifacationSpr), notificationSize, drawX - sprite_get_width(NotifacationSpr)/2, drawY - notificationSize/2)
    draw_sprite_part(NotifacationSpr, 0, 0, sprite_get_height(NotifacationSpr) - 20 - animationBorder, sprite_get_width(NotifacationSpr), 20 + animationBorder, drawX - sprite_get_width(NotifacationSpr)/2, drawY + notificationSize/2)
    
    draw_text_ext_transformed(drawX, drawY - notificationSize/2 + captionSize/2, string_hash_to_newline(ds_list_find_value(global.notificationList, 0)), 14, sprite_get_width(NotifacationSpr) - 40 - animationBorder*2, 0.9, 0.9, 0)
    
	draw_set_color(c_black)
    draw_set_font(global.PirateFont)
    draw_text_ext_transformed(drawX, drawY + captionSize/2 + 7, string_hash_to_newline(ds_list_find_value(global.notificationList, 1)), 12, sprite_get_width(NotifacationSpr) - 40 - animationBorder*2, 0.9, 0.9, 0)
    
    if onButton
        draw_sprite(ButtonSpr, 3, drawX, drawY + notificationSize/2 + 20)
    else
        draw_sprite(ButtonSpr, 0, drawX, drawY + notificationSize/2 + 20)
    
    draw_text(drawX, drawY + notificationSize/2 + 20, string_hash_to_newline("aye"))
    }



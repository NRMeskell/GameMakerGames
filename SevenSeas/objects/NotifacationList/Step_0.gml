/// @description Global Menu Open

global.eventOpen = instance_exists(Event)
global.pirateOpen = false

with Pirate
    if selected = true
        global.pirateOpen = true


///Close Notifacation

if ds_list_size(global.notificationList) > 0
    {
    if eventTimer = eventTimerLength 
        {   
        audio_play_sound(SlidingClosedSnd, 1, false)
        }
    eventTimer -= 1
    
    captionSize = string_height_ext(string_hash_to_newline(ds_list_find_value(global.notificationList, 0)), 14, sprite_get_width(NotifacationSpr)-20)*1.2
    textSize = string_height_ext(string_hash_to_newline(ds_list_find_value(global.notificationList, 1)), 12, sprite_get_width(NotifacationSpr)-20);
    
    notificationSize = captionSize + textSize*(ds_list_find_value(global.notificationList, 1) != 0) + 40
    
    onButton = !instance_exists(DumpItem) and point_in_rectangle(mouse_x, mouse_y, drawX - sprite_get_width(ButtonSpr)/3, drawY - sprite_get_height(ButtonSpr)/2.5 + (notificationSize)/2 + 20, drawX + sprite_get_width(ButtonSpr)/3, drawY + sprite_get_height(ButtonSpr)/2.5 + (notificationSize)/2 + 20)
    
    if (mouse_check_button_pressed(mb_left) and onButton)// or eventTimer < 1
        {
        closed = true
        audio_play_sound(SlidingOpenSnd, 1, false)
        }
        
    if !closed and drawY > room_height/2
        {
        drawY -= min(eventSpeed, point_distance(x, drawY, x, room_height/2)/eventFade + 1)
        }
    }
else
    eventTimer = eventTimerLength
    
if closed
    {
    drawY += min(eventSpeed, point_distance(x, drawY, x, room_height/2)/eventFade + 1)
    if drawY > room_height*1.25
        {
        ds_list_delete(global.notificationList, 0)
        ds_list_delete(global.notificationList, 0)
        eventTimer = eventTimerLength
        closed = false
        }
    }


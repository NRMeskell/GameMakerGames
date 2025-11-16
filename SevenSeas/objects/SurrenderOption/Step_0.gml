/// @description Close Notifacation

captionSize = string_height_ext(string_hash_to_newline(caption), 12, sprite_get_width(NotifacationSpr)-20) * 1.4
textSize = string_height_ext(string_hash_to_newline(text), 10, sprite_get_width(NotifacationSpr)-20)*1.2 + 10

notificationSize = captionSize + textSize

onButtonLeft = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawX - buttonShift - sprite_get_width(ButtonSpr)/4, drawY - sprite_get_height(ButtonSpr)/2.5 + (notificationSize)/2 + 20, drawX - buttonShift + sprite_get_width(ButtonSpr)/4, drawY + sprite_get_height(ButtonSpr)/2.5 + (notificationSize)/2 + 20)
onButtonRight = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawX + buttonShift - sprite_get_width(ButtonSpr)/4, drawY - sprite_get_height(ButtonSpr)/2.5 + (notificationSize)/2 + 20, drawX + buttonShift + sprite_get_width(ButtonSpr)/4, drawY + sprite_get_height(ButtonSpr)/2.5 + (notificationSize)/2 + 20)

if (mouse_check_button_pressed(mb_left) and (onButtonRight or onButtonLeft))
    {
    closed = true
    audio_play_sound(SlidingOpenSnd, 1, false)
    if onButtonLeft
        event_user(0)
	}
    
if closed
    {
    drawY += min(eventSpeed, point_distance(x, drawY, x, room_height/2)/eventFade + 1)
    if drawY > room_height*1.25
        {
        closed = false
        instance_destroy()
        }
    }

///Global Menu Open
global.pirateOpen = false

with Pirate
    if selected = true
        global.pirateOpen = true
        
if myDump != undefined
    myDump.selected = false



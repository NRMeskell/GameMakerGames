/// @description Grabbed

if distance_to_point(mouse_x, mouse_y) < 1
if mouse_check_button_pressed(mb_left)
    {
    Grabbed = true
    }
    
if mouse_check_button_released(mb_left)
    {
    Grabbed = false
    }
    
if Grabbed = true
    {
    Min = room_width/2 - sprite_get_width(Buttons)/2 + 25
    Max = room_width/2 + sprite_get_width(Buttons)/2 - 25
    
    if mouse_x > Min and mouse_x < Max
        x = mouse_x
        
    if mouse_x > Max
        x = Max
        
    if mouse_x < Min
        x = Min
        
    if Function = "Music"
        global.MusicVolume = (x - Min) / (Max - Min + 5)
        
    if Function = "Sound"
        global.SoundVolume = (x - Min) / ((Max - Min + 5)) * 0.66667
    }
    


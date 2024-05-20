/// @description start golf

if !inMenu
    event_user(2)
    
golfHoleNumber = 1
    
for(r = 0; r < ds_list_size(scores); r++)
    ds_list_replace(scores, r, 0)
 
alarm[0] = 5    

alarm[2] = -1//global.timeDiff
    
gameOver = false
room_goto(global.firstHole)



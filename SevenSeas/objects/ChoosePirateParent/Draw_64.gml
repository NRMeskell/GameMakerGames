/// @description Draw Stats
 
//Draw Actions
for(i=0; i<array_length_1d(myAction); i++)
    {
    actionStartX = 32 + 16
    actionStartY = 215 + 16
    if myAction[i] != noone
        {
        DrawAction(myAction[i], xWindow + actionStartX + 39*i, yWindow + actionStartY, 1)
        //Draw stat Info
        if point_in_rectangle(window_view_mouse_get_x(0), mouse_y, xWindow + actionStartX + 39*i - 16, yWindow + actionStartY - 16, xWindow + actionStartX + 40*i + 16, yWindow + actionStartY + 16)
            {
            startX = xWindow - sprite_get_width(ActionInfoSpr)/2 + 8 + sprite_get_width(PirateSheetSpr)/2
            startX += (point_distance(xWindow, 0, room_width/2 - 50, 0) > 150) *(sign(room_width/2 - xWindow))*50
            drawInfoY = yWindow + actionStartY - 60
            DrawActionInfo(myAction[i], startX, drawInfoY, true, "pirate", undefined)
            }
        }
    }
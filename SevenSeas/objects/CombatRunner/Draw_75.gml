/// @description Draw Action Info

drawOptionsX = room_width-45
drawOptionsY = 128
drawOptionsDis = 40
//draw action info
if playerTurn and __view_get( e__VW.XView, 0 ) = 0 and !instance_exists(Defeat) and !instance_exists(Event)
    {
    for(var i=0; i<ds_list_size(possibleEnemyActions); i++){
        if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), drawOptionsX-20, drawOptionsY + i*drawOptionsDis - 20, drawOptionsX+20, drawOptionsY + i*drawOptionsDis + 20)
            {
            drawActionInfoX = drawOptionsX - sprite_get_width(ActionInfoSpr) - 16
            drawActionInfoY = drawOptionsY + 20
            DrawActionInfo(showAction.object_index, drawActionInfoX, drawActionInfoY, false, "enemy", undefined)
            }
        }
    }


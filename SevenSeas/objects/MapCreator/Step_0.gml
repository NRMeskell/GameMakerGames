var __b__;
__b__ = action_if_variable(instance_number(CombatRunner) +instance_number(Defeat), 0, 0);
if __b__
{
{
///Grab Map

overMap = (window_view_mouse_get_x(0) > __view_get( e__VW.XPort, 1 ) and window_view_mouse_get_x(0) < __view_get( e__VW.XPort, 1 ) + __view_get( e__VW.WPort, 1 )) and (window_view_mouse_get_y(0) > __view_get( e__VW.YPort, 1 ) and window_view_mouse_get_y(0) < __view_get( e__VW.YPort, 1 ) + __view_get( e__VW.HPort, 1 ))

visible = true

if drawMiniHeight = miniHeight
    {
    //check grabbed
    if (overMap) and mouse_check_button_pressed(mb_left) if !(overPause or overZoomIn or overZoomOut or overBoatButton)
        {
        mouseGrabX = window_view_mouse_get_x(0)
        mouseGrabY = window_view_mouse_get_y(0)
        
        windowGrabX = __view_get( e__VW.XView, 1 )
        windowGrabY = __view_get( e__VW.YView, 1 )
        
        grabbed = true
        }
    
    if mouse_check_button_released(mb_left)
        {
        grabbed = false
        }
    
    //move map    
    if grabbed = true
        {
        if abs(sqrt(power(mouseGrabX - window_view_mouse_get_x(0),2)+sqrt(power(mouseGrabY - window_view_mouse_get_y(0),2)))) > 2
            onBoat = false
        
        __view_set( e__VW.XView, 1, windowGrabX + (mouseGrabX - window_view_mouse_get_x(0))*zoom )
        __view_set( e__VW.YView, 1, windowGrabY + (mouseGrabY - window_view_mouse_get_y(0))*zoom )
        }
        
    if __view_get( e__VW.XView, 1 ) < mapStart
        __view_set( e__VW.XView, 1, mapStart )
    if __view_get( e__VW.XView, 1 ) + __view_get( e__VW.WView, 1 ) > mapStart + mapSizeX
        __view_set( e__VW.XView, 1, mapStart + mapSizeX - __view_get( e__VW.WView, 1 ) )
        
    if __view_get( e__VW.YView, 1 ) < 0
        __view_set( e__VW.YView, 1, 0 )
    if __view_get( e__VW.YView, 1 ) + __view_get( e__VW.HView, 1 ) > mapSizeY
        __view_set( e__VW.YView, 1, mapSizeY - __view_get( e__VW.HView, 1 ) )
    }

///Close Map

global.pirateSelected = false
with Pirate if selected
    global.pirateSelected = true

instantClose = global.eventOpen or global.pirateSelected or ds_list_size(global.notificationList) > 0 or instance_exists(Store) or ds_list_size(ItemRunner.floatingItems) > 0 or instance_exists(PirateLeveler)
        
if drawMiniHeight > 0
    depth = -1000
else
    depth = -10

if mapClose or Clock.eventTimeLeft > 0 or instantClose
    {
    grabbed = false
    onBoat = true
	
	if instantClose{
		drawMiniHeight = 0
		__view_set( e__VW.HView, 1, 0 )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        __view_set( e__VW.HPort, 1, 0 )
	}
    
    if drawMiniHeight > 0
        {
        drawMiniHeight -= closeSpeed
        __view_set( e__VW.HView, 1, drawMiniHeight*zoom )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        __view_set( e__VW.HPort, 1, drawMiniHeight )
        }
    if drawMiniHeight < 0
        {
        drawMiniHeight = 0
        __view_set( e__VW.Visible, 1, false )
        }
    }
else
    {
    __view_set( e__VW.Visible, 1, true )
    
    if drawMiniHeight < miniHeight
        {
        drawMiniHeight += closeSpeed
        __view_set( e__VW.HView, 1, drawMiniHeight*zoom )
        __view_set( e__VW.HPort, 1, drawMiniHeight )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        }
        
    if drawMiniHeight > miniHeight
        {
        drawMiniHeight = miniHeight
        __view_set( e__VW.HView, 1, drawMiniHeight*zoom )
        __view_set( e__VW.HPort, 1, drawMiniHeight )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        }
    }
    
overClose = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), miniX, miniY - 20, miniX+miniWidth, miniY) or point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), miniX, miniY+drawMiniHeight, miniX+miniWidth, miniY+drawMiniHeight+20)

if overClose and mouse_check_button_pressed(mb_left) and !instantClose
    {
    if mapClose = true
        {
        mapClose = false
        audio_play_sound(OpenMapSnd, 1, false)
        }
    else
        {
        mapClose = true
        audio_play_sound(CloseMapSnd, 1, false)
        }
    }
    

///Snap to Boat

overBoatButton = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), miniX + miniWidth - buttonWidth*1.5, miniY+buttonHeight, 10)

if onBoat = true
    {
    while __view_get( e__VW.XView, 1 ) < MapShip.x - (miniWidth*zoom)/2 and __view_get( e__VW.XView, 1 ) < mapStart + mapSizeX-(miniWidth*zoom)
        __view_set_pp( e__VW.XView, 1, __view_get( e__VW.XView, 1 ) + 1 )
    while __view_get( e__VW.XView, 1 ) > MapShip.x - (miniWidth*zoom)/2 and __view_get( e__VW.XView, 1 ) > mapStart + 0
        __view_set_pp( e__VW.XView, 1, __view_get( e__VW.XView, 1 ) - 1 )

    while __view_get( e__VW.YView, 1 ) < MapShip.y - (miniHeight*zoom)/2 and __view_get( e__VW.YView, 1 ) < mapSizeY-(miniHeight*zoom)
        __view_set_pp( e__VW.YView, 1, __view_get( e__VW.YView, 1 ) + 1 )
    while __view_get( e__VW.YView, 1 ) > MapShip.y - (miniHeight*zoom)/2 and __view_get( e__VW.YView, 1 ) > 0
        __view_set_pp( e__VW.YView, 1, __view_get( e__VW.YView, 1 ) - 1 )    
    }
else
    {
    if mouse_check_button_pressed(mb_left) and overBoatButton
        {
        onBoat = true
        zoom = 1
        __view_set( e__VW.XView, 1, MapShip.x - (miniWidth*zoom)/2 )
        __view_set( e__VW.YView, 1, MapShip.y - (drawMiniHeight*zoom)/2 )
        __view_set( e__VW.HView, 1, drawMiniHeight*zoom )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        }
    }

///Pause Sail

overPause = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), miniX + miniWidth - buttonWidth*0.5, miniY+buttonHeight, 10)

if overPause and mouse_check_button_pressed(mb_left) and !global.inPort or keyboard_check_pressed(vk_space)
    global.mapPause = true - global.mapPause



///Zoom

overZoomIn = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), miniX + buttonWidth*0.5, miniY+buttonHeight, 10)
overZoomOut = point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), miniX + buttonWidth*1.5, miniY+buttonHeight, 10)


if overMap
    {
    if ((overZoomOut and mouse_check_button_pressed(mb_left)) or mouse_wheel_down()) and zoom < maxZoom and !mapClose
        {
        zoom += 0.25
        __view_set( e__VW.XView, 1, __view_get( e__VW.XView, 1 ) - ((miniWidth*zoom - __view_get( e__VW.WView, 1 ))/2) )
        __view_set( e__VW.YView, 1, __view_get( e__VW.YView, 1 ) - ((drawMiniHeight*zoom - __view_get( e__VW.HView, 1 ))/2) )
        __view_set( e__VW.HView, 1, drawMiniHeight*zoom )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        onBoat = false
        }
    if ((overZoomIn and mouse_check_button_pressed(mb_left)) or mouse_wheel_up()) and zoom > minZoom and !mapClose
        {
        zoom -= 0.25
        __view_set( e__VW.XView, 1, __view_get( e__VW.XView, 1 ) - ((miniWidth*zoom - __view_get( e__VW.WView, 1 ))/2) )
        __view_set( e__VW.YView, 1, __view_get( e__VW.YView, 1 ) - ((drawMiniHeight*zoom - __view_get( e__VW.HView, 1 ))/2) )
        __view_set( e__VW.HView, 1, drawMiniHeight*zoom )
        __view_set( e__VW.WView, 1, miniWidth*zoom )
        onBoat = false
        }
    }

}
}
else
{
{
///Combat

visible = false

mapClose = true
drawMiniHeight = 0
__view_set( e__VW.HView, 1, drawMiniHeight )
__view_set( e__VW.HPort, 1, drawMiniHeight )

}
}

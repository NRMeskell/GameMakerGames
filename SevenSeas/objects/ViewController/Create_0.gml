/// @description gui size

__view_set( e__VW.Visible, 0, true )
__view_set( e__VW.XView, 0, 0 )
__view_set( e__VW.YView, 0, 0 )
__view_set( e__VW.HView, 0, room_height )
__view_set( e__VW.WView, 0, room_width )
__view_set( e__VW.XPort, 0, 0 )
__view_set( e__VW.YPort, 0, 0 )
__view_set( e__VW.WPort, 0, room_width )
__view_set( e__VW.HPort, 0, room_height )

windowHeight = min(display_get_height() + 2, display_get_width()*room_height/room_width + 2)
windowWidth = windowHeight*(room_width/room_height) + 2

surface_resize(application_surface, windowWidth, windowHeight)
event_user(0)

/// @description Reset view

__view_set( e__VW.XView, 0, 0 )
__view_set( e__VW.YView, 0, 0 )
__view_set( e__VW.HView, 0, room_height )
__view_set( e__VW.WView, 0, room_width )

with ActionParent
    instance_destroy()


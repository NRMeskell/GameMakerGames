/// @description menu

if !instance_exists(Restart) and room != MenuRoom
    instance_create(room_width/2, room_height/2, Restart)
else
    with Restart
        event_user(0)


/// @description visible = false

if place_meeting(x,y,Worker)
    visible = false
else
    visible = true
    
depth = -y -1

if !place_meeting(x,y,NoPlace) and !place_meeting(x,y,NoWallPlace)
    {
    instance_destroy()
    }


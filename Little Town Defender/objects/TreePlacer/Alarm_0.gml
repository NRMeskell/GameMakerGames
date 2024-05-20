/// @description Tree

Distance = random_range(0,TreeSize)
Direction = random_range(0, pi)
    
XPlace = cos(Direction) * Distance
YPlace = sin(Direction) * Distance

if !place_meeting(x+ XPlace, y + YPlace,NoPlace)
    instance_create(x + XPlace, y + YPlace,Tree)

alarm[0] = TreeRate

if instance_number(Tree) < 5
    {
    alarm[0] = 1
    }


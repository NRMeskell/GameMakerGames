/// @description Vars

StartingSize = 150
TreeRate = 30
TreeSize = 250

repeat(StartingSize)
    {
    Distance = random_range(50,TreeSize)
    Direction = random_range(0, pi)
        
    XPlace = cos(Direction) * Distance
    YPlace = sin(Direction) * Distance
    if !place_meeting(x+ XPlace, y + YPlace,NoPlace)
        instance_create(x + XPlace, y + YPlace, Tree)
    }

alarm[0] = TreeRate


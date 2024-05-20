/// @description Bounce Sound 

event_user(1)


///afterBounce

if thrown
    {    
    //knock over
    with other
        {
        myCharacter.hitBy = other.thrower
        myCharacter.alarm[2] = room_speed * 5/global.timeDiff
        }
    //explode
    if (image_index = 1 or image_index = 3 or image_index = 6) and thrower != other.myCharacter.id
        {
        event_user(0)
        }
    }


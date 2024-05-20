/// @description Bounce Sound 

event_user(1)

///afterBounce

if thrown
    {    
    //knock over
    with other
        {
        }
    //explode
    if (image_index = 1 or image_index = 3 or image_index = 6) and thrower != other.id
        {
        event_user(0)
        }
    }



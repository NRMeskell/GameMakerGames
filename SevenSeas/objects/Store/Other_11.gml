/// @description Take Items

if canTake
    {
    if !overflow{
        event_user(2)
        }
    else
        {
        instance_create(0,0,StoreAreYouSure)
        }
    }


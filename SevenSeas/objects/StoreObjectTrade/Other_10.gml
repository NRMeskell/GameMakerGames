/// @description Store

if HasStored(type, sellAmount)
    {
    remove = false
    
    LoseCargo(type, sellAmount)
    
    if AbleToStore(0, amount)
        {
        StoreItem(0, amount)
        }
    else
        {
        StoreItem(type, sellAmount)
        }
    }


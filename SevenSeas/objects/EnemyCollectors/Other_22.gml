/// @description Update Character

with CoveCollector
    {
    if irandom(1)
        instance_destroy()
    else
        event_user(3)
    }

///Add Treasure

//Special Item
specialItem = GeneratePetItem(0)
specialItem.itemNumber = 11
specialItem.itemName = "Cove Compass"
specialItem.itemInfo = "A collectors' compass used to seek out other ships"

specialItem.itemPower = "summon ship"   
specialItem.itemPowerDescription = "when discarded, immediately enter combat with a merchant ship"
        
with Store{
    replaceItem = ds_list_find_value(items, 0)
    ds_list_replace(items, 0, other.specialItem)
    other.specialItem.myStore = id
    instance_destroy(replaceItem)
    }


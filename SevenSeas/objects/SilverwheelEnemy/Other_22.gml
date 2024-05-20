/// @description Update Character

with CaptainSilverwheel
    instance_destroy()


///Add Treasure

//Special Item
specialItem = GenerateShirtItem(0)
specialItem.itemNumber = 27
specialItem.itemName = "Captain's Coat"
specialItem.itemInfo = "Captain Silverwheel's ornate commanding coat."
specialItem.twoHanded = false
for(i=0; i<9; i++)
    specialItem.bonus[i] = 0
specialItem.bonus[0] = -1
specialItem.bonus[1] = -1
specialItem.bonus[5] = 3
    
with Store{
    replaceItem = ds_list_find_value(items, 0)
    ds_list_replace(items, 0, other.specialItem)
    other.specialItem.myStore = id
    instance_destroy(replaceItem)
    }


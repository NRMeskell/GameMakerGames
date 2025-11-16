/// @description Add Treasure

newItem = instance_create(0,0,StoreObjectStorable)
with newItem
    {        
    itemNumber = 1
    amount = 3
    cost = 0     
    myStore = Store.id
    }
ds_list_add(Store.items, newItem)


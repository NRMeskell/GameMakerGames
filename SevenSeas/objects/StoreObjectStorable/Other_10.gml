/// @description Store

remove = false

LoseCargo(0, cost)

StoreItem(itemNumber, amount)
ds_list_delete(myStore.items, ds_list_find_index(myStore.items, id))
remove = true

 
if remove   
    instance_destroy()


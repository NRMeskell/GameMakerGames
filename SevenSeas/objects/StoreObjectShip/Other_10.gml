/// @description Store

LoseCargo(0, cost)
SwitchShips(myShipType)
ds_list_delete(myStore.items, ds_list_find_index(myStore.items, id))

instance_destroy()


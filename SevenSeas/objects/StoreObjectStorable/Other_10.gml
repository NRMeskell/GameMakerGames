/// @description Store

remove = false

LoseCargo(0, cost)

StoreCargo(itemNumber, amount)
ds_list_delete(myStore.items, ds_list_find_index(myStore.items, id))
remove = true

// Use new wood to repair in Town
if itemNumber == 3 and global.inPort and global.portType == 1{
	while HasStored(3,1) and (Ship.myHealth < Ship.maxHealth){
	    UpdateHealth(Ship, (Ship.maxHealth div 10))
	    LoseCargo(3,1)
	}
}

 
if remove   
    instance_destroy()


/// @description Store

remove = false

LoseCargo(0, cost)

StoreCargo(itemNumber, amount)
ds_list_delete(myStore.items, ds_list_find_index(myStore.items, id))
remove = true

// Use new wood to repair in Town
if itemNumber == 3 and global.inPort and global.portType == 1{
	var boards = RepairWithBoards()
	if boards > 0 
		ds_list_add(global.notificationList, "Repairs!", string_repeat(string(boards) + " board(s) were used to repair the ship.", sign(boards)))
		
}

 
if remove   
    instance_destroy()


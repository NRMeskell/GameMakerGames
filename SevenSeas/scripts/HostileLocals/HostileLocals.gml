function HostileLocals() {
	ds_list_add(global.notificationList, "Hostile Locals!", "the local store-owners raise their prices by 25%!")

	with MapShip.targetPort{
	    //if object_index == DrawPort{
	        for(i=0; i<3; i++){
	            with slotBuild[i]{
	                for(r=0; r<3; r++){
	                    for(n = 0; n<ds_list_size(itemList[r]); n++){
	                            checkItem = ds_list_find_value(itemList[r], n)
	                            checkItem.cost = (checkItem.cost * 1.25) div 1
	                        }
	                    }
	                }
	            }
	        }



}

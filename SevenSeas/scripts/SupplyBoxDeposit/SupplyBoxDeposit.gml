/// @description Grab Barrel
function SupplyBoxDeposit() {

	types = ds_list_create()
	tradeList = ds_list_create()

	tradeNumber = irandom_range(1,4)
	for(i=0; i<tradeNumber; i++)
	    {
	    newTrade = instance_create(-50,-50,StoreObjectTrade)
	    with newTrade
	        {
	        type = irandom_range(2,5)
	        while ds_list_find_index(other.types, type) != -1
	            type = irandom_range(2,5)
        
	        ds_list_add(other.types, type)
	        selected = false
	        }
        
	    ds_list_add(tradeList, newTrade)
	    }
    
	with instance_create(room_width*5/6, room_height/2, Store)
	    {
	    allowManySelects = false
	    items = other.tradeList
    
	    for(i=0; i< ds_list_size(items); i++)
	        {
	        with ds_list_find_value(items, i)
	            {
	            myStore = other.id
	            viewed = false
	            selected = false
	            preview = false
            
	            }
	        }
    
	    storeName = "SUPPLY BOX"
	    leftButtonText = "deposit"
	    rightButtonText = "exit"
	    }
    
	script_execute(closeEventCode)







}

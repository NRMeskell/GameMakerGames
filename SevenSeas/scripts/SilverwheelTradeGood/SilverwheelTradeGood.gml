function SilverwheelTradeGood() {
	ds_list_add(global.notificationList, "Trades Begin!", "Captain Silverwheel offers a selection of equipment at a good price.")

	GetRandomStore(irandom_range(3,4), "Trades")
	
	with StoreObjectParent
		cost = cost div 2

	with CaptainSilverwheel{
	    myVar += 1
	    }     
        
	script_execute(closeEventCode)






}

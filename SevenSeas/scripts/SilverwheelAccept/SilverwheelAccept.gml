function SilverwheelAccept() {
	ds_list_add(global.notificationList, "Offer Accepted!", "Captain Silverwheel offers a selection of equipment for you to choose from.")

	GetRandomLoot(irandom_range(2,4), "Offer", [-1])

	with StoreObjectParent
	    selected = false
	with Store
	    allowManySelects = false
    
	with CaptainSilverwheel{
	    myVar += 2
		}

	script_execute(closeEventCode)



}

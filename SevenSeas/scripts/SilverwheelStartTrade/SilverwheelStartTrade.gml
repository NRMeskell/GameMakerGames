function SilverwheelStartTrade() {
	ds_list_add(global.notificationList, "Trades Begin!", "Captain Silverwheel offers a selection of equipment at a good price.")

	GetRandomStore(irandom_range(3,4), "Trades")

	with CaptainSilverwheel{
	    myVar += 2
	    event_user(1)
	    }     
        
	script_execute(closeEventCode)






}

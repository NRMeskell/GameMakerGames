function SilverwheelTradeRequest() {
	if argument0{
		ds_list_add(global.notificationList, "Trades Begin!", "Captain Silverwheel reluctently offers goods, but makes you promise to act better.")

		GetRandomStore(irandom_range(3,4), "Trades")

		with CaptainSilverwheel{
		    myVar += 2
		    event_user(1)
		    }     
		}
	else{
		ds_list_add(global.notificationList, "Insulted!", "Captain Silverwheel sails away furiously!")
	}
        
	script_execute(closeEventCode)
}

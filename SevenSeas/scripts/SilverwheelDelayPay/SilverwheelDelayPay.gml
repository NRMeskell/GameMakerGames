function SilverwheelDelayPay() {
	
	if argument0{
		ds_list_add(global.notificationList, "Payment delayed!", "The captain happily gives you time to gather gold, so long as you repay her kindness.")
	}else{
		var loseCargo = min(10, CargoAmount(0))
		LoseCargo(0, loseCargo)
		ds_list_add(global.notificationList, "delayed interest!", "The captain gives you time to gather gold, but takes " + string(loseCargo) + " gold as interest!")
	}
	script_execute(closeEventCode)
}

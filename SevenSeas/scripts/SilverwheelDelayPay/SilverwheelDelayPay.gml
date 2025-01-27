function SilverwheelDelayPay() {
	
	if argument0{
		ds_list_add(global.notificationList, "Payment delayed!", "Silverwheel is happy to give you time, so long as you eventually repay her kindness.")
	}else{
		var loseCargo = min(5+5*global.seaLevel, CargoAmount(0))
		LoseCargo(0, loseCargo)
		ds_list_add(global.notificationList, "delayed interest!", "The captain is annoyed, and takes " + string(loseCargo) + " gold as interest!")
	}
	
	
	script_execute(closeEventCode)
}

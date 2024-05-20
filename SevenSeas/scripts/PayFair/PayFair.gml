function PayFair() {
	//search
	ds_list_add(global.notificationList, "Fair payment!", "The crew are Happy with the payment and gain morale.")
    UpdateMorale(1, -1)
	
	script_execute(closeEventCode, 2)
}

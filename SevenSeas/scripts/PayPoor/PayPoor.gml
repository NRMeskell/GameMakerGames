function PayPoor() {
	//search
	ds_list_add(global.notificationList, "Poor payment!", "The crew are unhappy with the payment and lose morale.")
    UpdateMorale(-2, -1)
	AddReputation("repute", -1, "poor payments")
	script_execute(closeEventCode, 2)
}
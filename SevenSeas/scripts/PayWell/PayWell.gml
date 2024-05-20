function PayWell() {
	//search
	ds_list_add(global.notificationList, "Grand payment!", "The crew are very happy with the payment and gain significant morale!")
    UpdateMorale(2, -1)
	
	AddReputation("repute", 1, "crew payments")
	
	script_execute(closeEventCode, 2)
}

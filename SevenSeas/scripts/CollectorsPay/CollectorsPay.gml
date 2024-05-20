function CollectorsPay() {
	//run away
    
	ds_list_add(global.notificationList, "fee payed!", "the Patrol are grateful for your cooperation.")

	AddReputation("patrol", 1, "cooperation with cove patrol")

	script_execute(closeEventCode, 2)







}

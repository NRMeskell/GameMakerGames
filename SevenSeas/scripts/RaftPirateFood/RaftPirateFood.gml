function RaftPirateFood() {

	if irandom(3) == 0{
		ds_list_add(global.notificationList, "Food delivered!", "The food lands safely in the sailors raft. He throws an item up to the ship as a thanks!")
		GetRandomLoot(1, "thrown item", [-1])
		}
	else{
		//interrogation code
		ds_list_add(global.notificationList, "Food delivered!", "the food lands safely on the raft. The sailor thanks you for the food as they float away.")
		}
    
	script_execute(closeEventCode)
}

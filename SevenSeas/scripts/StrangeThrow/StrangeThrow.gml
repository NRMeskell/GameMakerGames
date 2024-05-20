function StrangeThrow() {
	//engage
    AddReputation("nature", -1, "barrel overboard")
	ds_list_add(global.notificationList, "The container is thrown overbaord!", "it's unknown what caused the strange noises.")
	instance_create(0, 0, Barrel)
	script_execute(closeEventCode, 2)
}

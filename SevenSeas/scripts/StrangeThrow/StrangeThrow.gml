function StrangeThrow() {
	//engage
	ds_list_add(global.notificationList, "The container is thrown overboard!", "it's unknown what caused the strange noises.")
	instance_create(0, 0, Barrel)
	audio_stop_sound(ScratchingSnd)
	script_execute(closeEventCode, 2)
}

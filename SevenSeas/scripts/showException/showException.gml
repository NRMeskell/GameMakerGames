function showException(argument0){
	ds_list_add(global.notificationList, "AVAST! AN ERROR HAS BEEN FOUND!", argument0.longMessage)
	
	with Event{
		closeEventCode()
	}
}
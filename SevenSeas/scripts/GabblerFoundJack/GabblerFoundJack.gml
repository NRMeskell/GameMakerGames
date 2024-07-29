// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GabblerFoundJack(){
	global.moraleBoost = "Old gabbler"
	ds_list_add(global.notificationList, "Old Gabbler Sees Jack!", "She cannot believe he's real, and follows your crew from tavern to tavern asking questions.")
	with Pirate if name = "Ol' Jack Grayhair"
		UpdateMorale(-2, -1)
}

function GabblerGiveCrown(){
	global.moraleBoost = "Old gabbler"
	ds_list_add(global.notificationList, "Old Gabbler Sees Crown!", "She refuses to tell any tales until you return the crown to it's rightful owners.")
	
}

function GabblerSailedRocks(){
	global.moraleBoost = "Old gabbler"
	ds_list_add(global.notificationList, "Old Gabbler Impressed!", "The Old Gabbler sits to talk, but has no tales to 'impress the crew who sailed the crashing rocks!'")
	UpdateMorale(1, -1)
}
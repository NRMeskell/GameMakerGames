function KnifeGameHurt() {
	//Rats
	ds_list_add(global.notificationList, "Knife accident!", KnifeGamePirate.name + " hurt themselves while playing with a knife!")
	
	with KnifeGamePirate
		myHealth = round(myHealth*0.75)
}

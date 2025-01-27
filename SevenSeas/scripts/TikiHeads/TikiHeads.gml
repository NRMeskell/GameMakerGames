function TikiHeads() {
	//Get Treasure

	global.moraleBoost = "idols"
	result = irandom(3)
	
	if result = 0 {
		cursedCrew = RandomPirate()
		with cursedCrew{
			event_user(3)
		}
		ds_list_add(global.notificationList, "Cursed!", "The idols unleash a curse upon the crew, crippling " + cursedCrew.name + "!")
	}
	else if result <= 2 and irandom(1){
		ds_list_add(global.notificationList, "No response", "Water drains from the idols, but nothing more appears to happen")
	}
	else {
		blessedCrew = RandomPirate()
		while blessedCrew.mySlot.slotType == "bed"
			blessedCrew = RandomPirate()
			
		with blessedCrew{
			PirateLevelUp(true, false)
		}
		ds_list_add(global.notificationList, "Blessed!", "The idols rumble with power, and bestow a blessing upon " + blessedCrew.name + "!")
	}
	with TikiOffer
		goAway = true
}

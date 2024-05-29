function TikiHeads() {
	//Get Treasure

	global.moraleBoost = "idols"
	result = irandom(campPower)
	
	if result = 0 {
		cursedCrew = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		with cursedCrew{
			event_user(3)
		}
		ds_list_add(global.notificationList, "Cursed!", "The idols unlease a curse uopon the crew, crippling " + cursedCrew.name + "!")
	}
	else if result <= 2 and irandom(1){
		ds_list_add(global.notificationList, "No response", "Water drains from the idols, but nothing more appears to happen")
	}
	else {
		blessedCrew = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		while blessedCrew.mySlot.slotType == "bed"
			blessedCrew = instance_find(Pirate, irandom(instance_number(Pirate)-1))
			
		with blessedCrew{
			PirateLevelUp(true, false)
		}
		ds_list_add(global.notificationList, "Blessed!", "The idols rumble with power, and bestow a blessing upon " + blessedCrew.name + "!")
	}
	with TikiOffer
		goAway = true
}

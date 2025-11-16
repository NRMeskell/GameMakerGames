function TikiHeads() {
	//Get Treasure

	global.moraleBoost = "idols"
	result = irandom(4)
	
	if result <= 3{
		ds_list_add(global.notificationList, "No response", "Lava drains from the idols, but nothing more appears to happen")
	}
	else {
		var cursedPirates = false
		with Pirate{
			if body == sprite_get_number(PirateManSkinSpr)-1{
				cursedPirates = true
			if string_starts_with(myShirt.itemName, "Cursed")
				cursedPirates = true
			if string_starts_with(myHat.itemName, "Cursed")
				cursedPirates = true
			if string_starts_with(myPants.itemName, "Cursed")
				cursedPirates = true
			}
		}
		
		// no cursed pirates, so level up random pirate
		if cursedPirates == false{
			var blessedCrew = RandomPirate()			
			with blessedCrew{
				PirateLevelUp(true, false)
			}
			ds_list_add(global.notificationList, "Blessed!", "The idols rumble with power, and bestow a blessing upon " + blessedCrew.name + "!")
		}
		else{
			
			ds_list_add(global.notificationList, "Blessed!", "The idols rumble with power, and lift all curses from the crew!")
			LiftCurses()
		}
	}
	with TikiOffer
		goAway = true
}

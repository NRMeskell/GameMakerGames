function GabblerMeet() {
	with instance_create(0,0,Event)
	    {
		myCharacter = 6
	    buttonNumber = 2
		if OldGabbler.myState == "unmet"{
			ds_list_add(buttons, GabblerIgnore, GabblerTellTales)
		}
		else {
			ds_list_add(buttons, GabblerIgnore, choose(GabblerTellTales, GabblerRocks, GabblerJack))
		}
		
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "ignore them", "listen to a tale")
        
		global.moraleBoost = "Old gabbler"
	    global.allowSelect = false
		
	    captionText = "Old Gabbler"
	    myPirate = RandomPirate()
		if OldGabbler.myState == "unmet"
			eventText = "The crew meets an odd character in a tavern, who would love to tell a 'free' tale." 
	    else
	        eventText = "The Old Gabbler is spotted again, and offers another one of her stories!" 
		OldGabbler.myState = "met"
		}
}

function GabblerTellTales(){
	var tales = choose("the open seas", "her peg leg", "burried treasure"),
		result = "The Old Gabbler tells a wonderful tale about " + tales + "!", 
	
	if irandom(1) and HasStored(0, 1){
		var coins = min(irandom_range(1,5), CargoAmount(0))
		result += " Your purse be about " + string(coins) + " gold lighter..."
		LoseCargo(0, coins)
	}
	UpdateMorale(choose(1,2,2,3), -1)
	ds_list_add(global.notificationList, "Grand Tale!", result)
	closeEventCode()
}

function GabblerIgnore(){
	UpdateMorale(-1, -1)
	ds_list_add(global.notificationList, "Dissapointed Crew!", "The Old Gabbler huffs away, and the crew be sad not to hear a tale.")
	closeEventCode()
}


function GabblerJack(){
	var result = "She gives a key to a cage which supposedly holds Ol' Jack Grayhair, the legendary pirate who was locked away!" 
	OldGabbler.myVar = 1
	if irandom(1) and HasStored(0, 1){
		var coins = min(irandom_range(1,5), CargoAmount(0))
		result += "##Your purse be about " + string(coins) + " gold lighter..."
		LoseCargo(0, coins)
	}
	UpdateMorale(choose(1,2), -1)
	ds_list_add(global.notificationList, "Grand Tale!", result)
	
	with instance_create(0,0,Store){
		//Special Item
		specialItem = GeneratePetItem(0)
		specialItem.itemNumber = 15
		specialItem.itemName = "Ancient Key"
		specialItem.itemInfo = "A key supposedly for the cage Ol' Jack Grayhair is trapped inside."
		specialItem.itemPower = "jack grayhair"   
		specialItem.itemPowerDescription = "Will automatically open the cage in the Old Ruins."
		ds_list_add(items, specialItem)
		}
	
	closeEventCode()
}

function GabblerCrown(){
	var result = "The Gabbler tells of the lost tropical crown. How the Frog King would rejoice its return!" 

	if irandom(1) and HasStored(0, 1){
		var coins = min(irandom_range(1,5), CargoAmount(0))
		result += "##Your purse be about " + string(coins) + " gold lighter..."
		LoseCargo(0, coins)
	}
	UpdateMorale(choose(1,2), -1)
	ds_list_add(global.notificationList, "Grand Tale!", result)
	closeEventCode()
}

function GabblerRocks(){
	result = "The Gabbler shows you an old rock, who some say clicks when the crashing rocks are safe to pass!" 

	with instance_create(0,0,Store){
		//Special Item
		specialItem = GeneratePetItem(0)
		specialItem.itemNumber = 14
		specialItem.itemName = "Clicking Stones"
		specialItem.itemInfo = "Stones which click when the crashing rocks are calm."
		specialItem.itemPower = "crashing rocks"   
		specialItem.itemPowerDescription = "Increases the chance of navigating the Crashing Rocks."
		ds_list_add(items, specialItem)
		}

	if irandom(1) and HasStored(0, 1){
		var coins = min(irandom_range(1,5), CargoAmount(0))
		result += "##Your purse be about " + string(coins) + " gold lighter..."
		LoseCargo(0, coins)
	}

	ds_list_add(global.notificationList, "Grand Tale!", result)
	closeEventCode()
}

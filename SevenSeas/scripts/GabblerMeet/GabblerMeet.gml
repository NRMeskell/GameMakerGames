function GabblerMeet() {
	with instance_create(0,0,Event)
	    {
		myCharacter = 6
	    buttonNumber = 2
		if OldGabbler.myState == "unmet"{
			ds_list_add(buttons, GabblerIgnore, GabblerTellTales)
		}
		else {
			ds_list_add(buttons, GabblerIgnore, choose(GabblerTellTales, GabblerRocks, GabblerJack, GabblerCrown))
		}
		
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "ignore them", "listen to a tale")
        
		global.moraleBoost = "Old gabbler"
	    global.allowSelect = false
		
	    captionText = "Old Gabbler"
	    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
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
	UpdateMorale(choose(1,2), -1)
	ds_list_add(global.notificationList, "Grand Tale!", result)
	closeEventCode()
}

function GabblerIgnore(){
	UpdateMorale(-1, -1)
	ds_list_add(global.notificationList, "Dissapointed Crew!", "The Old Gabbler huffs away, and the crew be sad not to hear a tale.")
	closeEventCode()
}


function GabblerJack(){
	var result = "She tells of Ol' Jack Grayhair, A great pirate who patrolled the seas long ago. Legends say he still lives, caged by in an ancient tower." 
	OldGabbler.myVar = 1
	if irandom(1) and HasStored(0, 1){
		var coins = min(irandom_range(1,5), CargoAmount(0))
		result += "##Your purse be about " + string(coins) + " gold lighter..."
		LoseCargo(0, coins)
	}
	UpdateMorale(choose(1,2), -1)
	ds_list_add(global.notificationList, "Grand Tale!", result)
	closeEventCode()
}

function GabblerCrown(){
	var result = "The Gabbler tells of the lost tropical crown, an heirloom of the royal frogs. How the Frog King would rejoice it's return!" 

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
	result = "The Gabbler produces an old stone. Tales say it clicks when the crashing rocks are safe to pass, but who knows if that's true?" 

	if item == 0{
		//Special Item
		specialItem = GeneratePetItem(0)
		specialItem.itemNumber = 14
		specialItem.itemName = "Clicking Stones"
		specialItem.itemInfo = "Stones which click when the crashing rocks are calm."
		specialItem.itemPower = "crashing rocks"   
		specialItem.itemPowerDescription = "Increases the chance of navigating the Crashing Rocks."
		}

	if irandom(1) and HasStored(0, 1){
		var coins = min(irandom_range(1,5), CargoAmount(0))
		result += "##Your purse be about " + string(coins) + " gold lighter..."
		LoseCargo(0, coins)
	}

	ds_list_add(global.notificationList, "Grand Tale!", result)
	closeEventCode()
}

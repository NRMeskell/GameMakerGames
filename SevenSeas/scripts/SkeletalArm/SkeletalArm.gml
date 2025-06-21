function SkeletalArmArrives() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
		skelType = choose("hand", "skull")
	    buttonNumber = 3
	    ds_list_add(buttons, SkeletalArmLeave, SkeletalArmSmash, SkeletalArmGive)
	    ds_list_add(buttonStats, 0, 3, 4)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], 0)
	    ds_list_add(buttonCosts, 0, 0, 1)
	    ds_list_add(buttonText, "leave the " + skelType + " be", "smash the " + skelType, "give the " + skelType + " food")
        
	    global.allowSelect = false
	    captionText = "Skeletal " + skelType + "!"
    
	    eventText = "a detached, skeletal " + skelType + " is found scraping around the deck!"
	    global.moraleBoost = "skeleton"  
	    }
}

function SkeletalArmLeave() {
	ds_list_add(global.notificationList, "skeleton leaves", "the creepy " + skelType + " wanders about the ship before climbing back overboard.")
	UpdateMorale(-2, -1)
	UpdateMorale(1, global.DARING)
}

function SkeletalArmSmash() {
	if argument0{
		ds_list_add(global.notificationList, "shattered!", "The skeleton is smashed into pieces, and the crew celebrate the victory.")
		UpdateMorale(1, -1)
	}
	else{
		member = RandomPirate()
		ds_list_add(global.notificationList, "attacked!", "the skeletal " + skelType + " attaches itself to " + member.firstName + " and takes off a chunk of skin!")
		with member
			UpdateHealth(id, -20)
		UpdateMorale(-2, -1)
		UpdateMorale(1, global.DARING)
	}
	closeEventCode()
}

function SkeletalArmGive(){
	ds_list_add(global.notificationList, "skeleton satisfied!", "the mysterious skeleton devours the food before scratching its way overboard.")
	UpdateMorale(-1, -1)
	UpdateMorale(1, global.DARING)
}


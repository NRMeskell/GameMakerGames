function LargeEggArrive(){
	with instance_create(0,0,Event)
	    {
		myCharacter = 17
	    buttonNumber = 2
		
		ds_list_add(buttons, EggHoist, EggCrack, closeEventCode)		
	    ds_list_add(buttonStats, 3, 6, 0)
	    ds_list_add(buttonRequires, global.eventDiff[3, 0], global.eventDiff[6, 0], 0)
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "hoist the egg aboard", "Crack the egg for food", "sail past the egg")
        
		global.moraleBoost = "large egg"
	    global.allowSelect = false
		
	    captionText = "Large Egg"
		eventText = "A strange egg sits in a large next atop a lone rock."
		instance_create(-1000, 0, EggStand)
	}
}


function EggHoist(){
	if argument0{
		EggStand.image_index = EggStand.image_number-1
		EggStand.image_speed = 0
		LargeEgg.myState = "aboard"
		ds_list_add(global.notificationList, "Egg Aboard!", "The crew lower the egg from it's nest, and stow it in a safe location on the ship.")
	}else{
		ds_list_add(global.notificationList, "Nest too high!", "The crew are unable to get the egg, and are forced to sail on.")
		UpdateMorale(-1, global.JOLLY)
	}
}

function EggCrack(){
	EggStand.image_index = EggStand.image_number-1
	EggStand.image_speed = 0
	instance_destroy(LargeEgg)
		
	if argument0{
		ds_list_add(global.notificationList, "Lovely Meal!", "The crew find delicious food inside the shell.")
		GetRandomLoot(2, "EGG", [4, 6])
	}else{
		ds_list_add(global.notificationList, "Spoiled egg!", "The crew are unable to get any good food from inside the shell.")
		UpdateMorale(-1, global.JOLLY)
	}
	
}


function LargeEggBuy(){
	with instance_create(0,0,Event)
	    {
		myCharacter = 17
	    buttonNumber = 2
		
		ds_list_add(buttons, EggSell, closeEventCode)		
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Sell the egg", "refuse the offer")
        
		global.moraleBoost = "large egg"
	    global.allowSelect = false
		
	    captionText = "Large Egg"
		eventText = "An odd collector offers to buy the egg from your crew for 20 gold."
	}

}

function EggSell(){
	GetRandomLoot(1, "Egg Money", [0])
	with ds_list_find_value(Store.itemList, 0)
		amount = 20
	
	instance_destroy(LargeEgg)
}


function EggSitting(){
	with instance_create(0,0,Event)
	    {
		myCharacter = 17
	    buttonNumber = 2
		
		ds_list_add(buttons, EggCrack, closeEventCode)		
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Crack the egg", "leave the egg be")
        
		global.moraleBoost = "large egg"
	    global.allowSelect = false
		
	    captionText = "Large Egg"
		eventText = "The egg continues to sit in storage. The crew begin to wonder if it's time to crack it open for food..."
	}
}


function EggHatching(){
	with instance_create(0,0,Event)
	    {
		myCharacter = 17
	    buttonNumber = 2
		
		ds_list_add(buttons, EggHatch, EggThrow)		
	    ds_list_add(buttonStats, 6, 0)
	    ds_list_add(buttonRequires, global.eventDiff[6, 0], 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "help the egg hatch", "throw it overboard")
        
		global.moraleBoost = "large egg"
	    global.allowSelect = false
		
	    captionText = "Large Egg"
		eventText = "Sounds come from the storage room as the egg beings to shake, wobble, and crack!"
	}
}

function EggThrow(){
	ds_list_add(global.notificationList, "Egg Overboard!", "The cracking egg is tossed into the ocean!")
	instance_destroy(LargeEgg)
}

function EggHatch(){
	if argument0{
		LargeEgg.myState = "pterry"
		LargeEgg.myVar = 0
		//Special Item
		specialItem = GeneratePetItem(0)
		specialItem.itemNumber = 19
		specialItem.itemName = "pterry"
		specialItem.itemInfo = "A dangerous pet to keep around."
		specialItem.myAction = PterryAttackAction
		specialItem.itemPower = "none"
		specialItem.itemPowerDescription = "none"
	
		GetRandomLoot(0, "HATCHED EGG", undefined)
		with Store{
		    ds_list_add(items, other.specialItem)
		 } 
	}
}

function PterryFishes(){
	ds_list_add(global.notificationList, "PTerry Fishes!", "The reptile returns to the ship with several large fish.")
	GetRandomLoot(1, "TASTY FISH", [4,6])
	
	LargeEgg.myVar += 1
}


function PterryAttacks(){
	LargeEgg.myVar += 1
	global.moraleBoost = "pterry attack"
	UpdateHealth(RandomPirate(), -15)
	UpdateMorale(-1, -1)
	
	with instance_create(0,0,Event)
	    {
		myCharacter = 18
	    buttonNumber = 2
		
		ds_list_add(buttons, closeEventCode, PterryLeaves)		
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "let pterry stay", "force pterry off the ship")
        
		global.moraleBoost = "large egg"
	    global.allowSelect = false
		
	    captionText = "pterry"
		eventText = "Pterry attacks a crew member, injuring them and lowering morale!"
	}
}

function PterryLeaves(){
	ds_list_add(global.notificationList, "Pterry Leaves!", "The large reptile flies from the ship and disappears into the distance!")
	instance_destroy(LargeEgg)
	
	with instance_create(Ship.drawX-1, Ship.drawY-20, BirdEvent){
		image_blend = merge_color(c_orange, c_blue, 0.3)
		image_xscale = -1
		sprite_index = PterryAttackSpr
	}
	
	var pterryItem;
	with Pirate if myPet.itemName == "pterry" {
		pterryItem = myPet.id;
	}
	
	UnequipItem(pterryItem)
	with pterryItem{
		while ds_list_find_index(ItemRunner.floatingItems, id) != -1
			ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
		instance_destroy()
	}
}
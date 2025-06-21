function SpiritLordArrive() {
	with instance_create(0,0,Event){
		myCharacter = 11
		
		//add pirates who are keen
		pirateList = ds_list_create()
		for(var p=0; p<instance_number(Pirate) and ds_list_size(pirateList)<2; p++){
			var addPirate = RandomPirate()
			if addPirate.myMainPer == global.KEEN
				ds_list_add(pirateList, addPirate)
		}
		
		var slotsLeft = 2-ds_list_size(pirateList);
		var piratesLeft = instance_number(Pirate) - ds_list_size(pirateList);
		repeat(min(slotsLeft, piratesLeft)){
			var addPirate = RandomPirate()
			while ds_list_find_index(pirateList, addPirate) != -1{
				addPirate = RandomPirate()
			}
			ds_list_add(pirateList, addPirate)
		}
			
	    //buttonNumber = 3
		for(var p=0; p<ds_list_size(pirateList); p++){
			var pirate = ds_list_find_value(pirateList, p)
			
			if p==0 
				ds_list_add(buttons, SpiritLordPlayDice1)
			else 
				ds_list_add(buttons, SpiritLordPlayDice2)
				
			ds_list_add(buttonText, "let " + pirate.firstName + " " + pirate.lastName + " play dice")
		}
		
	    ds_list_add(buttons, SpiritLordRun) 
		ds_list_add(buttonText, "run from the#spirit lord")
		
	    ds_list_add(buttonStats, 0, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, 0)
			
		
	    global.allowSelect = false
	    captionText = "Lord of the undead"
	    if SpiritLord.myState == "unmet"
	        eventText = "The lord of the undead 'offers' the crew a game of dice."
		else
			eventText = "The lord of the undead returns for another game of dice."
		
		global.moraleBoost = "spirit lord"
	}
}


function SpiritLordPlayDice1(){
	playPirate = ds_list_find_value(pirateList, 0)
	SpiritLordPlayDice()
}

function SpiritLordPlayDice2(){
	playPirate = ds_list_find_value(pirateList, 1)
	SpiritLordPlayDice()
}

function SpiritLordPlayDice() {
	
	//calculate shance of winning
	var win = false
	if playPirate.myMainPer == global.KEEN
		var win = (irandom(1) == 0)
	else
		var win = (irandom(2) == 0)
	
	
	//won contest
	if win{
		GetRandomLoot(0, "WINNINGS", undefined)
		with Store{
			var item = instance_create(0,0,StoreObjectStorable)
			with item{
				amount = min(2, max(0, 5-CargoAmount(8)))
				if amount > 0{
			        name = "s-gems"
			        description = "A beautiful treasure, touched by an ancient spirit"
			        previewName = "spirit gems"
			        itemNumber = 8    
			        cost = 0
				}
				else{
					name = "jewels"
			        amount = 2
			        itemNumber = 1 
			        cost = 0
				}
		    }
					
			ds_list_add(items, item)
		}
		
		if SpiritLord.myState != "bested"{
			ds_list_add(global.notificationList, "Game won!", "The clever " + playPirate.firstName + " beats the spirit lord, who graciously accepts defeat and pays their due.")
			SpiritLord.myState = "bested"
		}
		else if SpiritLord.myState == "bested"{
			ds_list_add(global.notificationList, "Game won!", "the spirit lord, having never before been bested twice, retreats from this world!")
			instance_destroy(SpiritLord)
		}
	}
	//lost contest
	else{
		if SpiritLord.myState == "unmet"
			SpiritLord.myState = "met"
			
		ds_list_add(global.notificationList, "Game Lost!", "The Spirit Lord takes " + playPirate.firstName + "'s soul as his winnings, and politely thanks the crew for the pleasure.")
		
		with playPirate{
			body = sprite_get_number(PirateManSkinSpr)-1
			face = sprite_get_number(PirateManFaceSpr)-1
			UpdateMorale(-3, -1)
			UpdateMorale(1, global.DARING)
			
			if surface_exists(fullPirateSurface)
				MakePirateSurface(fullPirateSurface, 0, 0)
			if surface_exists(smallPirateSurface)
				MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
			if surface_exists(tagPirateSurface)
				MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
		}
	}
	
	script_execute(closeEventCode)
}


function SpiritLordRun() {	
	
	if SpiritLord.myState != "running"
		ds_list_add(global.notificationList, "Spirit Lord Laughs", "you've chosen the spirit lord's favorite game, and they gives you a healthy head start before ")
	else{
		if argument0
			ds_list_add(global.notificationList, "Escaped!", "Your ship disappears into the fog, but the lord's haunting laugh takes some time to fade.")
		else{
			ds_list_add(global.notificationList, "Caught!", "Escaping is hopeless, and their laugh grows loud as the spirit ship closes in!")
			instance_create(0,0,SpiritLordShip)
			instance_destroy(EventDrawer)
		}
	}
	SpiritLord.myState = "running"
	
	script_execute(closeEventCode)
}


function SpiritLordCatches(){
	with instance_create(0,0,Event){
	    myCharacter = 11
	    buttonNumber = 2
	    ds_list_add(buttons, SpiritLordAttack, SpiritLordRun) 
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "turn and fight", "continue to flee")
        
	    global.allowSelect = false
	    captionText = "Lord of the Undead"
	    global.moraleBoost = "spirit lord" 
    
	    eventText = "The sound of a laugh begins to echo through the fog!"   
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip{
	        myShipHull = SpiritLordShipSpr
	        flagColor = c_white
	        myFlag = SkeletalFlagSpr
	    }
	}
}

function SpiritLordAttack() {
	
	instance_create(0,0,SpiritLordShip)
	instance_destroy(EventDrawer)
	
	script_execute(closeEventCode, 2)
}




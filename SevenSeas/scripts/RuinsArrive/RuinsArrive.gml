function RuinsArrive() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, closeEventCode, RuinsSearch, RuinsHelp)
	    ds_list_add(buttonStats, 0, 3, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "sail by the ruins", "search for treasure", "help release the prisoner" )
        
	    global.allowSelect = false
	    captionText = "Old Ruins!"
    
	    eventText = "The crew spot a run down tower with someone swinging in a cage." 
	    global.moraleBoost = "ruins"  
	    }
		
	instance_create(0,0,Ruins)
}

function RuinsSearch() {
	if argument0{
		ds_list_add(global.notificationList, "Treasure Found!", "The dark exploration scared and invigorated the crew.")
		GetRandomLoot(irandom_range(1,3), "Treasure", [-1, 0, 0, 1, 1])
		UpdateMorale(-1, global.KEEN)
		UpdateMorale(1, global.DARING)
		UpdateMorale(-1, global.JOLLY)
	}
	else{
		if irandom(1){
			ds_list_add(global.notificationList, "Nothing Found!", "The dark exploration scared the crew.")
			UpdateMorale(-1, global.KEEN)
			UpdateMorale(1, global.DARING)
			UpdateMorale(-1, -1)
		}
		else{
			var injuredPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
			ds_list_add(global.notificationList, "Ruins collapse!", "An old stairwell breaks underfoot, injuring " + injuredPirate.firstName)
			injuredPirate.myHealth -= 25
		}
	}
	closeEventCode()
}

function RuinsHelp() {
	open = false
	with ItemParent if itemPower == "jack grayhair"
		other.open = true
		
	if argument0 or open{
		ds_list_add(global.notificationList, "Ol' Jack Grayhair!", "The crew invites aboard the legendary 'Jack Grayhair'!")
		OldGabbler.myVar = 2
			
		grayhair = instance_create(0,0,StoreObjectPirate)
		with grayhair{
			myMainPer = global.DARING
			face = myMainPer*2
			body = 1
			myGender = 1
			hair = 5
			beard = 7
			face = 
			skinDark = random(0.4)
			skinColor = merge_color(c_white, merge_color(c_black, c_red, 0.2), skinDark)
			hairColor = make_color_rgb(50,50,50)
				
			firstName = "Ol' Jack"
			lastName = "Grayhair"
			name = firstName + " " + lastName
				
			EquipItem(id, MakeRandomHandItem(2))
			EquipItem(id, MakeRandomPantsItem(1))
			EquipItem(id, MakeRandomShirtItem(2))
			EquipItem(id, MakeRandomHatItem(2))
				
			PirateLevelUp(false, false)
			PirateLevelUp(false, false)
			PirateLevelUp(false, false)
			cost = 0
		}
		
		with instance_create(0,0,Store)
			ds_list_add(items, grayhair)
			
		with ItemParent{
			if ds_list_find_index(ItemRunner.floatingItems, id) != -1{
				ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
				instance_destroy()
			}
		}
	}
	else{
		var injuredPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		ds_list_add(global.notificationList, "Ruins collapse!", "The stairwell to the cage breaks underfoot, injuring " + injuredPirate.firstName)
		injuredPirate.myHealth -= 25
	}
	closeEventCode()
}

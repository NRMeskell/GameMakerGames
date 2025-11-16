function GeneratePetItem(argument0) {
	newItem = instance_create(0,0,StoreObjectItem)
	with newItem
	    {   
		color[0] = make_color_rgb(0,44,119)
		color[1] = make_colour_rgb(200,200,200)
		color[2] = make_color_rgb(158,126,2)
		color[3] = make_color_rgb(140,0,145)
		color[4] = make_color_rgb(2,98,0)
		
	    if argument0 == 0 {
	        color[0] = make_color_rgb(155,0,0)
	        color[1] = make_color_rgb(190,0,0)
	        color[2] = make_color_rgb(0,68,180)
	        color[3] = make_color_rgb(192,192,0)
	        color[4] = make_color_rgb(2,98,0)
	        itemNumber = irandom(2)
	        itemName = choose("cookie", "scarlett", "molly", "cory", "polly", "cracker", "ollie", "ringo", "talon")
	        itemInfo = "a colorful flying companion, smart and quick to help"
        
	        itemPower = "morale loss"   
	        itemPowerDescription = "equipped crew never loses morale, and their attacks gain +2 priority"
	    }
	    else if argument0 = 1 {
	        color[0] = make_colour_rgb(165,165,165)
	        color[1] = make_color_rgb(25,25,25)
	        color[2] = make_color_rgb(146,82,0)
	        color[3] = make_color_rgb(94,68,35)
			color[4] = make_color_rgb(80,80,80)
	        itemNumber = irandom_range(3,5)
	        itemName = choose("mango", "bongo", "flopsy", "popsie", "silly", "gaga", "dopey", "coconut", "rica", "paco")
	        itemInfo = "a cute climbing companion, happy to hop in a cannon or two"
        
	        itemPower = "morale loss"   
	        itemPowerDescription = "equipped crew never loses morale, and their cannon attacks do not use cannonballs"
	    }
	    else{
			var chooseType = irandom(6)
			if chooseType == 0 {
		        itemNumber = 16
		        itemName = "spare rope"
		        itemInfo = "allows a pirate to handle the sails from unlikely places"
        
		        itemPower = "rigging"   
		        itemPowerDescription = "equipped pirate provides a rigging bonus, no matter where they are on board."
		    }
		    else if chooseType == 1 {
		        itemNumber = 7
		        itemName = "spyglass"
		        itemInfo = "a telescoping lens to increase a pirate's vision"
        
		        itemPower = "wheel"   
		        itemPowerDescription = "equipped pirate provides one wheel bonus, no matter where they are on board."
		    }
		    else if chooseType == 2 {
		        itemNumber = 8
		        itemName = "rum flask"
		        itemInfo = "a small container containing liquid energy"
        
		        itemPower = "recharge"   
		        itemPowerDescription = "equipped pirate's combat skills take one less turn to recharge"
		    }
		    else if chooseType == 3 {
		        itemNumber = 9
		        itemName = "bandages"
		        itemInfo = "a 'clean' roll of cloth to help heal wounds"
        
		        itemPower = "medical"   
		        itemPowerDescription = "equipped pirate provides one medical bonus, no matter where they are on board."
		    }
		    else if chooseType == 4 {
		        itemNumber = 10
		        itemName = "deck gloves"
		        itemInfo = "great for moving about the ship safely"
        
		        itemPower = "combat move"   
		        itemPowerDescription = "equipped pirate can move freely during combat"
		    }
			if chooseType == 5 {
		        itemNumber = 6
		        itemName = "Compass"
		        itemInfo = "a navigation tool to help sail the 7 seas"
        
		        itemPower = "speed bonus 10"   
		        itemPowerDescription = "if equipped pirate is at the helm, the ship sails 10% faster"
		    }
			if chooseType == 6 {
		        itemNumber = 17
		        itemName = "tool belt"
		        itemInfo = "A set of handy craftsman tools"
        
		        itemPower = "medical ship"   
		        itemPowerDescription = "when using a campfire, repair 20 ship damage per equipped pirate level." 
		    }
		}
		myColor = color[irandom(array_length_1d(color)-1)]
		spriteIndex = EquipPetSpr          
		itemCost = 30 + irandom_range(-5,5)
	}
	return newItem
}

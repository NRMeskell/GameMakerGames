function GeneratePetItem(argument0) {
	newItem = instance_create(0,0,StoreObjectItem)
	with newItem
	    {   
	    color[0] = c_white
	    if argument0 == 0
	        {
	        color[0] = make_color_rgb(155,0,0)
	        color[1] = make_color_rgb(190,0,0)
	        color[2] = make_color_rgb(0,68,180)
	        color[3] = make_color_rgb(192,192,0)
	        color[4] = make_color_rgb(2,98,0)
	        itemNumber = irandom(2)
	        itemName = choose("cookie", "mango", "scarlett", "molly", "Ava", "cleo", "annie", "paco", "cory", "polly", "skeet", "cracker", "ollie", "ringo", "macaw", "rico", "talon", "paco")
	        itemInfo = "a colorful flying companion"
        
	        itemPower = "morale loss"   
	        itemPowerDescription = "equipped pirate cannot lose morale"
	        }
	    else if argument0 = 1
	        {
	        color[0] = make_colour_rgb(165,165,165)
	        color[1] = make_color_rgb(25,25,25)
	        color[2] = make_color_rgb(146,82,0)
	        color[3] = make_color_rgb(94,68,35)
	        itemNumber = irandom_range(3,5)
	        itemName = choose("bongo", "buster", "flopsy", "popsie", "flo", "wanky", "talullah", "gaga", "dopey", "coconut")
	        itemInfo = "a cute climbing companion"
        
	        itemPower = "morale gain"   
	        itemPowerDescription = "equipped pirate gains 50% extra morale"
	        }
	    else if argument0 = 2
	        {
	        itemNumber = 6
	        itemName = "Compass"
	        itemInfo = "a navagation tool to help sail the 7 seas"
        
	        itemPower = "speed bonus"   
	        itemPowerDescription = "if equipped pirate is at the helm, the ship sails 25% faster"
	        }
	    else if argument0 = 3
	        {
	        itemNumber = 7
	        itemName = "spyglass"
	        itemInfo = "a telescoping lens to increase a pirate's vision"
        
	        itemPower = "avoid"   
	        itemPowerDescription = "if equipped pirate is in a rigging slot, 30% of ambushes are avoided."
	        }
	    else if argument0 = 4
	        {
	        itemNumber = 8
	        itemName = "rum flask"
	        itemInfo = "a small container containing liquid energy"
        
	        itemPower = "recharge"   
	        itemPowerDescription = "equipped pirate's combat skills take one less turn to recharge"
	        }
	    else if argument0 = 5
	        {
	        itemNumber = 9
	        itemName = "bandages"
	        itemInfo = "a 'clean' roll of cloth to help heal wounds"
        
	        itemPower = "heal"   
	        itemPowerDescription = "equipped pirate slowly regains health while sailing"
	        }
	    else if argument0 = 6
	        {
	        itemNumber = 10
	        itemName = "deck gloves"
	        itemInfo = "great for moving about the ship safely"
        
	        itemPower = "combat move"   
	        itemPowerDescription = "equipped pirate can move freely during combat"
        
	        color[0] = make_color_rgb(155,0,0)
	        color[1] = make_color_rgb(128,0,0)
	        color[2] = make_color_rgb(0,44,119)
	        color[3] = make_colour_rgb(200,200,200)
	        color[4] = make_color_rgb(25,25,25)
	        color[5] = make_color_rgb(158,126,2)
	        color[6] = make_color_rgb(140,0,145)
	        color[7] = make_color_rgb(2,98,0)
	        }
    
	    myColor = color[irandom(array_length_1d(color)-1)]
	    spriteIndex = EquipPetSpr          
	    itemCost = 30 + irandom_range(-5,5)
	    }
    
	return newItem



}

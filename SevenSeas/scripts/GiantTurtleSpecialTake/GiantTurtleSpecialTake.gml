function GiantTurtleSpecialTake() {		
	if argument0{
		item = irandom(1)

		if item == 0{

		    //Special Item
		    specialItem = GeneratePetItem(0)
		    specialItem.itemNumber = 12
		    specialItem.itemName = "Life Shell"
		    specialItem.itemInfo = "A shell full of the ocean's plentiful life"
		    specialItem.itemPower = "full health"   
		    specialItem.itemPowerDescription = "Equipped crew member will never gain an injury."
		    }    
		if item == 1{
		    //Special Item

		    specialItem = GeneratePetItem(0)
		    specialItem.itemNumber = 13
		    specialItem.itemName = choose("bubbles", "pulpo", "starburst", "peeps", "mochi")
		    specialItem.itemInfo = "A small octopus who loves to fix things!"
    
		    color[0] = make_color_rgb(55, 118, 0)
		    color[1] = make_color_rgb(0, 0, 145)
		    color[2] = make_color_rgb(215, 0, 215)
		    color[3] = make_color_rgb(128, 128, 0)
		    specialItem.myColor = color[irandom(array_length_1d(color)-1)]
    
		    specialItem.itemPower = "defense"   
		    specialItem.itemPowerDescription = specialItem.itemName + " will protect equiped pirate, reducing combat damage they take by 25%"
		    } 
    
		GetRandomLoot(0, "TURTLE GIFT", undefined)
		with Store{
		    ds_list_add(items, other.specialItem)
		    }   
		GiantTurtle.myVar = 0
	}
	else{
		ds_list_add(global.notificationList, "Item fell!", "The item was knocked off the turtle, and it dives slowly down after it")
	}
    
	script_execute(closeEventCode)
}

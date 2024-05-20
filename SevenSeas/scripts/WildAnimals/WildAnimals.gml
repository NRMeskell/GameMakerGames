function WildAnimals() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, WildIgnore, WildScare, WildCatch) 
	    ds_list_add(buttonStats, 0, 3, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,1], global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "ignore the animals", "scare the animals away", "catch an animal")
        
	    global.allowSelect = false
	    captionText = "Escaped Animals!"
	    eventText = "pigs, rats, monkeys, mice, parrots, frogs, lizards and more run throught the streets!"
	    global.moraleBoost = "animals"
	    }





}

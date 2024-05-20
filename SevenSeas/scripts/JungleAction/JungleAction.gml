function JungleAction() {
	//Get Treasure

	result = irandom(campPower + global.pirateNum[global.DARING])

	global.moraleBoost = "exploring"

	if result == 0
	    {
		if irandom(1){
		    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		    ds_list_add(global.notificationList, "Nothing found!", "jungle was wild and " + myPirate.name + " was injured while exploring!")
		    myPirate.myHealth = 0
		}
		else{
			lostItems = LoseRandomItems(irandom_range(1,2))
		    ds_list_add(global.notificationList, "Nothing found!", "jungle was wild and the crew lost several items while exploring:#")
		    myPirate.myHealth = 0
		}
	}
	else if result == 1
	    {
	    ds_list_add(global.notificationList, "Nothing found!", "jungle was wild, and the crew be tired and lost morale")
	    with Pirate
	        {
	        UpdateMorale(-1, -1)
	        UpdateMorale(choose(0,1), global.DARING)
	        }
	    }
	else if result <= 3
	    {
	    loot = GetRandomLoot(irandom_range(3,4), "jungle tree", [1,1,3,6,6])
	    lootText = getItemText(loot, ["", "", choose("shiny stones", "jungle gems"), "", "", "", "", choose("fruit", "meat")])
	    ds_list_add(global.notificationList, "sucessful expedition!", "the daring crew found " + lootText + " hidden deep in the jungle!")
	    }
	else
	    {
	    animalType = irandom(1)
	    aType[0] = "parrot"
	    aType[1] = "monkey"
	    ds_list_add(global.notificationList, aType[animalType] + " found!", "the daring crew trapped a " + aType[animalType] + " in the jungle and brought it back to the ship!")
	    with Pirate
	        {
	        UpdateMorale(1,global.KEEN)
	        }
	    ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(animalType))
    
	    }
}

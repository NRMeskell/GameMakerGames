function JungleAction() {
	//Get Treasure

	result = irandom(campPower + global.pirateNum[global.DARING])

	global.moraleBoost = "exploring"

	if result == 0{
		lostItems = LoseRandomItems(1)
		ds_list_add(global.notificationList, "Nothing found!", "jungle was thick and the crew lost items supplies:#" + lostItems)
	}
	else if result == 1{
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
	    ds_list_add(global.notificationList, "successful expedition!", "the crew found " + lootText + " hidden deep in the jungle!")
	    }
	else
	    {
	    animalType = irandom(1)
	    aType[0] = "parrot"
	    aType[1] = "monkey"
	    ds_list_add(global.notificationList, aType[animalType] + " found!", "the crew trapped a " + aType[animalType] + " and brought it back!")
	    with Pirate
	        {
	        UpdateMorale(1,global.KEEN)
	        }
	    ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(animalType))
    
	    }
}

/// @description Gabbler Events

ds_list_add(locations, global.seaNames[2])
UpdateCharacterEvents()
UpdateCharacterPortEvents(GabblerMeet)

if myState != "unmet"{
	//Found Jack Grayhair
	if myVar == 2{
		UpdateCharacterPortEvents(GabblerFoundJack);
		myVar = 3;
	}
	
	//Possess Frog King's Crown
	with ItemParent{
		if itemName == "Tropical Crown"{
			with other
				UpdateCharacterPortEvents(GabblerGiveCrown);
		}
	}
	
	//Have sailed the rocks (sea conquered)
	if ds_map_find_value(MapCreator.seas[2], "conquered"){
		UpdateCharacterPortEvents(GabblerSailedRocks)
	}
}
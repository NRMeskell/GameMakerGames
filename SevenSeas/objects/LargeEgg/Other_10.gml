/// @description Egg Events

if myState == "unmet"{
	ds_list_add(locations, global.seaNames[5])
	UpdateCharacterEvents(LargeEggArrive)
	UpdateCharacterPortEvents()
}else if myState == "aboard"{
	ds_list_add(locations, global.seaType)
	UpdateCharacterEvents(EggSitting, EggSitting, EggSitting, EggHatching)
	UpdateCharacterPortEvents(EggSell)
}else if myState == "pterry"{
	ds_list_add(locations, global.seaType)
	if myVar < 2
		UpdateCharacterEvents(PterryAttacks, PterryFishes, PterryFishes, PterryFishes)
	else
		UpdateCharacterEvents(PterryAttacks, PterryFishes, PterryFishes, PterryFishes, PterryLeaves)
	UpdateCharacterPortEvents()
}

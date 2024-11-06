/// @description CurseLifter Reactions

ds_list_add(locations, global.seaNames[3])
	
if myState != "running"
	UpdateCharacterEvents(SpiritLordArrive)
else
	UpdateCharacterEvents(SpiritLordCatches)

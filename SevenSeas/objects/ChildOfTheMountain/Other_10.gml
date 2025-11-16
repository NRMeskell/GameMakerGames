/// @description Frog King Reactions

ds_list_add(locations, global.seaNames[4])
		
if myState == "unmet" {
    UpdateCharacterEvents(MountainChildArrive)
}
else {
	if myState = "annoyed"
		UpdateCharacterEvents(MountainChildAnnoyed)
	UpdateCharacterEvents(MountainChildArrive)
}

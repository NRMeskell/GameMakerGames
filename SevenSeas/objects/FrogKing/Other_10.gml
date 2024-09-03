/// @description Frog King Reactions

ds_list_add(locations, global.seaNames[1])
		
if myState == "unmet" or myState == "free" or myState == "payment" or myState == "leave"{
    UpdateCharacterEvents(FrogKingArrive)
    }
else if myState = "annoyed"{
    UpdateCharacterEvents(choose(FrogKingArrive, FrogKingAttack))
    }
else{
	UpdateCharacterEvents(FrogKingArrive)
}

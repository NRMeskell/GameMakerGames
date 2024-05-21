/// @description Become friendlier
ds_list_add(locations, global.seaNames[0])

if myVar < 0{
    UpdateCharacterEvents(PirateCollectorsCaught)
    }
else if myVar > 1{
    UpdateCharacterEvents(PirateCollectorsGrateful)
    }
else if myVar > 2 {
    UpdateCharacterEvents(PirateCollectorsGrateful, PirateCollectorsHeal)
    }
else {
    UpdateCharacterEvents(PirateCollectorsArrive)
    }


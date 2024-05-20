/// @description Become friendlier
ds_list_add(locations, global.seaNames[0])
    
var cove = searchReputationType("patrol")[0]

if myState == "chase"{
    UpdateCharacterEvents(PirateCollectorsCaught)
    }
else if cove > 2{
    UpdateCharacterEvents(PirateCollectorsGrateful)
    }
else if cove > 4 {
    UpdateCharacterEvents(PirateCollectorsGrateful, PirateCollectorsHeal)
    }
else {
    UpdateCharacterEvents(PirateCollectorsArrive)
    }


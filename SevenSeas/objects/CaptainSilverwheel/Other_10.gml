/// @description Silverwheel level up

ds_list_add(locations, global.seaNames[0], global.seaNames[1], global.seaNames[2])
event_user(1)

if myState == "unmet"{
    UpdateCharacterEvents(SilverwheelArrive)
    }
else if myState == "trade"{
    UpdateCharacterEvents(SilverwheelTrade)
}
else if myState == "repay"{
    UpdateCharacterEvents(SilverwheelRepay)
}
else{
    UpdateCharacterEvents(SilverwheelChallenge)
}


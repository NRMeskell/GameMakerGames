function GetSpecialAttack() {
	possibleList = ds_list_create()
	for(i=0; i<4; i++)
	    if ds_list_find_index(myStats, i) != -1{
			// add to list of options (with wheel weighted at 3)
	        repeat(1+2*(ds_list_find_index(myStats, i)==3))
				ds_list_add(possibleList, i)
		}
        
	result = ds_list_find_value(possibleList, irandom(ds_list_size(possibleList)-1))
	if result != 2 and irandom(3) == 0
		result = 3

	if result == 0
	    return choose(HeavyBoardingAction, SwarmAction, HammerBlowAction, ScoutingAction, FinishingStabAction, HoldFastAction)
	else if result == 1
	    return choose(BarrageAction, LookoutAction, CauseChaosAction, SniperAction, TargetedFireAction, BleedingShotAction)
	else if result == 2
	    return choose(BroadsideAction, WarningShotAction, CannonSprayAction, ChainShotAction, ShrapnelAction, ConcentratedFireAction)
	else
	    return choose(EngageAction, DisengageAction, OutmaneuverAction, SurgeryAction, RammingAction, SurpriseAction, SurpriseAction)
}

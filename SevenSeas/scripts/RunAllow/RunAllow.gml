/// @description clean up the mess
function RunAllow() {

	if sign(irandom(2))
	    {
	    ds_list_add(global.notificationList, "corridors cleared!", myPirate.firstName + " cleared easy running paths, making movement around the ship easier!")
	    
		}
	else if irandom(1)
	    {
		cargoAmount = irandom_range(1,3)
		LoseRandomCargo(cargoAmount)
	    ds_list_add(global.notificationList, "Cargo overboard!", myPirate.firstName + " threw " + string(cargoAmount) + " off the ship to make room!")
	    }
	else{
		cargoAmount = irandom_range(1,3)
		switch(irandom(3)){
			case 0: ds_list_add(ItemRunner.floatingItems, MakeRandomHandItem(global.seaLevel)) break;
			case 1: ds_list_add(ItemRunner.floatingItems, MakeRandomHatItem(global.seaLevel)) break;
			case 2: ds_list_add(ItemRunner.floatingItems, MakeRandomPantsItem(global.seaLevel)) break;
			case 3: ds_list_add(ItemRunner.floatingItems, MakeRandomShirtItem(global.seaLevel)) break;
		}
	    ds_list_add(global.notificationList, "Item Found!", myPirate.firstName + " found an unclaimed item burried beneath stacks of cargo.")
	    
	}


}

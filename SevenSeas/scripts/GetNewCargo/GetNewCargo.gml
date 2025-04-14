function GetNewCargo(argument0) {
	if argument0 < 10
	    {
	    if AbleToStore(newThingType, newThingAmount)
	        {
	        StoreCargo(newThingType, newThingAmount)
        
	        with DrawPort
	            if selected
	                {
	                option[0] = "Action Used"
	                buttonAction[0] = UsedAction
	                if sprite_index = ChestSpr
	                    sprite_index = ChestLootedSpr
	                if sprite_index = BarrelSpr
	                    sprite_index = BarrelLootedSpr
	                }
                    
	        BackToDrawPort(9)
	        }
	    }
}

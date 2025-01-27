function SupplyBoxArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, SupplyBoxFloat, SupplyBoxDeposit, SupplyBoxWithdraw)
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "Let the box float by", "deposit supplies into box", "enter withdraw code")
        
	    global.allowSelect = false
	    captionText = "Pirate supply Box!"
	    eventText = "Cargo can be deposited for gold, or clever captains can withdraw treasure!"   
	    global.moraleBoost = "Supply Box"
	    }

	with instance_create(0,0,Barrel)
	    {
	    floatAway = false
	    placeX = 50
	    sprite_index = SupplyBoxSpr
	    }






}

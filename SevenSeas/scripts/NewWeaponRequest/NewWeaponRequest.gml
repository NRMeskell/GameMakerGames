function NewWeaponRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, NewWeaponAllow)
     
	    global.allowSelect = false
	    eventText = "Our weapons are poor! Can use some gunpowder and junk to make an explosive new weapon?"
	    global.moraleBoost = "weapon"
	    }
}

function RunAround(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, RunAllow) 
	    global.allowSelect = false
	    eventText = "'The ships corridors are so crowded, it makes me furious! Can I move the cargo?'"  
    
	    global.moraleBoost = "cargo moving"
	    }
}

function RunAround(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, RunAllow) 
	    global.allowSelect = false
	    eventText = "The ships corridors are too crowded! It's so hard to run freely! Can I move some stuff?"  
    
	    global.moraleBoost = "running"
	    }
}

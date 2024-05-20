function BreakRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, BreakAllow)
     
	    global.allowSelect = false
	    eventText = "We've been worked too hard, and I'm having no fun. Can I take a break?"
	    global.moraleBoost = "break"
	    }
    
  




}

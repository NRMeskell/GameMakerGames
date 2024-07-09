function ShantyRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, ShantiesAllow)
     
	    global.allowSelect = false
	    eventText = "'The crew never joins in when I sing shanties! Can I enforce an hour of shanties?'"
	    global.moraleBoost = "shanties"
	    }
    
  




}

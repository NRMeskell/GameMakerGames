function BackToDrawPort(argument0) {
	if argument0 < 10
	    {
	    global.allowSelect = true
    
	    instance_destroy()
    
	    with DrawPort
	        if selected = true
	            event_user(0)
	    }



}

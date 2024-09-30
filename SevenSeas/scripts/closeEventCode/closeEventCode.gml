function closeEventCode() {
	with Event{
		global.allowSelect = true
    
		instance_destroy()

		with DrawPort
		    selected = false
		
		with EventDrawer if !global.inPort	
			floatAway = true
	}
}

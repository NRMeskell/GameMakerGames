function Shortcut() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, ShortcutIgnore, ShortcutMap) 
	    ds_list_add(buttonStats, 0, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[5, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "continue on current course", "navigate the shortcut")
        
	    global.allowSelect = false
	    captionText = "Shortcut!"
	    eventText = "the charts show a shortcut in these waters, but it be difficult to navigate!"   
	    global.moraleBoost = "shortcut"
	    }




}

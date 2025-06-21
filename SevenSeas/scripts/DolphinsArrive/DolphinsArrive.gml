function DolphinsArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, DolphinsStartPlaying, DolphinsBefriend)
	    ds_list_add(buttonStats, 0, 5, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "Let the crew play", "Befriend the Dolphins")
        
	    global.allowSelect = false
	    captionText = "A pod of dolphins arrives!"
	    eventText = "The crew abandon their posts to play!"   
	    global.moraleBoost = "dolphins"
	    }

	repeat(irandom_range(3, 6))
	    instance_create(0,0,Dolphins)






}

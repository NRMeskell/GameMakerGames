function MermaidRocks() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, MermaidIgnore, MermaidGrab, MermaidFriend)
	    ds_list_add(buttonStats, 5, 3, 5)
	    ds_list_add(buttonRequires, global.eventDiff[5,1], global.eventDiff[3, 3], global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "ignore the rocks", "grab the treasure", "befriend the mermaids")
        
	    global.allowSelect = false
	    captionText = "Mermaid rocks!"
	    eventText = "Rocks full of beautiful, singing mermaids pass by the ship!" 
	    global.moraleBoost = "mermaids"
	    myShip = instance_create(-1000,0,MermaidEvent)
	    }

}

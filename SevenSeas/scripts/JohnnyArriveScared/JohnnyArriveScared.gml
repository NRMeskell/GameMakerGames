// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function JohnnyArriveScared(){
	with instance_create(0,0,Event)
	    {
	    myCharacter = 1
	    buttonNumber = 2
	    ds_list_add(buttons, closeEventCode, JohnnyAllow)
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "ignore the boy", "invite him on board")
        
	    global.allowSelect = false
	    captionText = "Johnny Shortsticks"

	    eventText = "a curly-haired boy watches the crew, but seems too scared to approach." 
	    JohnnyShortsticks.myVar = 1
	    global.moraleBoost = "Johnny" 
	    }

}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TavernOfBones(){
	with instance_create(0,0,Event)
	{
	    buttonNumber = 2
	    ds_list_add(buttons, TavernBonesWait, closeEventCode) 
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Enter the Tavern", "Sail Away")
        
	    global.allowSelect = false
	    captionText = "Tavern of Bones!"
	    eventText = "The ship comes upon a spooky Tavern with joyful music and gales of laughter coming from inside!"  
	    global.moraleBoost = "tavern" 
		
		myShip = instance_create(-1000,0,TavernofBonesEvent)
	}
}

function TavernBonesWait(){
	Wait(Clock.fullDay/8, TavernBonesEnter, argument0)
}

function TavernBonesEnter(){
	if irandom(1){
		ds_list_add(global.notificationList, "Joyful dancing!", "The crew spend some time joyfully dancing and singing, exiting the tavern renewed.")
		with Pirate	{
			UpdateHealth(id, 25)
			UpdateMorale(1, -1)
		}
	}
	else if irandom(1){
		ds_list_add(global.notificationList, "Strange Dancing!", "The crew spend some time joyfully dancing, but the strange tavern sucks their life away while inside.")
		with Pirate	{
			UpdateHealth(Ship, -25)
			UpdateMorale(1, -1)
		}
	}
	else{		
		var myPirate = RandomPirate()
		CursePirate(myPirate)
		ds_list_add(global.notificationList, "Cursed Dancing!", "The crew spend some time dancing, but " + myPirate + " couldn't help but eat the cursed food.")
	}
}
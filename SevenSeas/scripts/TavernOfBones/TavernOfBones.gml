// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TavernOfBones(){
	with instance_create(0,0,Event)
	{
	    buttonNumber = 2
	    ds_list_add(buttons, TavernBonesEnter, closeEventCode) 
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

function TavernBonesEnter(){
	if irandom(1){
		ds_list_add(global.notificationList, "Joyful dancing!", "The crew spend some time joyfully dancing and singing, exiting the tavern renewed.")
		with Pirate	{
			myHealth += 25
			UpdateMorale(1, -1)
		}
	}
	else if irandom(1){
		ds_list_add(global.notificationList, "Strange Dancing!", "The crew spend some time joyfully dancing, but the strange tavern sucks their life away while inside.")
		with Pirate	{
			myHealth -= 15
			UpdateMorale(1, -1)
		}
	}
	else{
		myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		ds_list_add(global.notificationList, "Skeletal Crew Member!", myPirate.name + " ate food in the tavern, and returned a cursed pirate!")
		global.moraleBoost = "skeleton" 
		with myPirate{
			body = sprite_get_number(PirateManSkinSpr)-1
			face = sprite_get_number(PirateManFaceSpr)-1
			UpdateMorale(-5, -1)
			UpdateMorale(3, global.DARING)
		}
	}
}
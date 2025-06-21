// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrinkRum(){
	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, DrinkFlask) 
	    global.allowSelect = false
	    eventText = "I found a strange flask which looks very tasty! Can I take a swig?"  
    
	    global.moraleBoost = "flask"
	    }
}

function DrinkFlask(){
	if irandom(2){
		ds_list_add(global.notificationList, "Tasty Drink!", "The flask was full of a sweet liquid, and " + myPirate.firstName + " recovers health and morale!")
		UpdateHealth(myPirate, myPirate.myHealth*.25)
	}
	else{
		ds_list_add(global.notificationList, "Poison!", "The flask was full of a bitter poison, and " + myPirate.firstName + " weakens!")
		UpdateHealth(myPirate, -myPirate.myHealth*1.25)
		with myPirate 
			UpdateMorale(-1,-1)
	}
	
}
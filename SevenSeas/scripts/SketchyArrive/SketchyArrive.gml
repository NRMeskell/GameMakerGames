function SketchyArrive() {
	with instance_create(0,0,Event){
	    myCharacter = 12
	    buttonNumber = 3
	    ds_list_add(buttons, SketchyDecline, SketchyTrade, SketchyStartCombat) 
	    ds_list_add(buttonStats, 0, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, SketchySailsman.myState == "traded" ? 3 : 15, 0)
	    ds_list_add(buttonText, "decline to trade", SketchySailsman.myState == "traded" ? "browse his wares" : "pay and browse his wares", "try to seize the wares")
			
		
	    global.allowSelect = false
	    captionText = "Sketchy Merchant"
	    if SketchySailsman.myState = "unmet"
	        eventText = "The unkempt helmsman of a cargoship offers to trade - after an upfront payment!" 
		else if SketchySailsman.myState == "traded"
	        eventText = "The sktchy trader returns! As you paid his large fee already, he'll trade for a small price." 
        else
			eventText = "The overloaded ship returns. The helmsmen offers to trade - after the upfront payment!" 
			
		if !global.inPort{
		    myShip = instance_create(-1000,0,ShipEvent)
		    with myShip
		        {
		        myShipHull = SketchyShipSpr
		        flagColor = c_white
		        myFlag = ScavengerFlagSpr
		        }
		}
	    global.moraleBoost = "sketchy merchant"
	    }
}


function SketchyDecline(){
	if SketchySailsman.myState == "decline"
		SketchyStartCombat()
	else if irandom(1)
		SketchySailsman.myState = "met"
	else
		SketchySailsman.myState = "decline"	
}

function SketchyTrade(){
	global.seaLevel += 1
	GetRandomLoot(4, "Sketchy Trades", undefined)
	with StoreObjectParent
		cost = (cost * 0.5) div 1
	global.seaLevel -= 1
	
	SketchySailsman.myState = "met"
}

function SketchyStartCombat(){
	instance_create(0,0,SketchyEnemy)

	instance_destroy(EventDrawer)
	with SketchySailsman    
	    instance_destroy()
		
	script_execute(closeEventCode)
}
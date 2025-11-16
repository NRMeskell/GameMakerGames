function VolcanoRumbling() {
	with instance_create(0,0,Event)
	    {
		survived = false
		myCharacter = 14 + Volcano.myVar
	    buttonNumber = 2
		
		ds_list_add(buttons, RumblingWait, AppeaseVolcano)		
	    ds_list_add(buttonStats, 3, 9)
	    ds_list_add(buttonRequires, global.eventDiff[3, Volcano.myVar], 0)
	    ds_list_add(buttonCosts, 0, 1)
	    ds_list_add(buttonText, "survive the waves", "appease the volcano's rage")
        
		global.moraleBoost = "volcano"
	    global.allowSelect = false
		
	    captionText = "Burning Volcano"
		eventText = "The island's volcano begins to rumble, creating large waves which toss the ship!"
		with Volcano
			event_user(1)
		instance_create(x, y, WaveMaker)
	}
}

function RumblingWait() {
	Wait(1/8*Clock.fullDay, VolcanoWaited, argument0)
	survived = argument0
}

function VolcanoWaited(){
	global.moraleBoost = "volcano"
	
	if !survived{
		ds_list_add(global.notificationList, "Ship tossed about!", "The dangerous waves have tossed the ship, damaging the ship and crew!")
		UpdateHealth(Ship, -irandom_range(75, 100))
		with Pirate
			UpdateHealth(id, -irandom_range(20, 30))
	}else{
		ds_list_add(global.notificationList, "Crew safe!", "The crew were able to overcome the dangerous waves without any damage!")
	}
	
	if Volcano.myVar == 1
		ds_list_add(global.notificationList, "rumbling over!", "The rumbling has stopped, but smoke is now rising from the volcano's peak...")
	else if Volcano.myVar == 2
		ds_list_add(global.notificationList, "rumbling over!", "The rumbling has stopped, but lava chnks have started to spew from the volcano!")
}

function AppeaseVolcano(){
	ds_list_add(global.notificationList, "rumbling over!", "The ember stone appeases the volcano, and the rumbling stops.")
	closeEventCode()
}


function VolcanoErupting(){
	closeEventCode()
	with EventDrawer{
		floatAway = true
	}
	with instance_create(0,0,Event)
	    {
		survived = false
		myCharacter = 16
	    buttonNumber = 3
		
		ds_list_add(buttons, EruptionWait, EruptionWait, VolcanoEruptAppease)		
	    ds_list_add(buttonStats, 5, 3, 9)
	    ds_list_add(buttonRequires, global.eventDiff[5, 2], global.eventDiff[3, 2], 0)
	    ds_list_add(buttonCosts, 0, 0, 1)
	    ds_list_add(buttonText, "navigate the eruption", "ride-out the eruption", "appease the volcano's rage")
        
		global.moraleBoost = "volcano"
	    global.allowSelect = false
		
	    captionText = "Burning Volcano"
		
		if Volcano.myState != "erupting"
			eventText = "The island's volcano begins to erupt and throw huge chunks of lava across the sea!"
		else
			eventText = "The island's volcano continues to erupt as lava pours into the sea!"

		
		if !instance_exists(WaveMaker){
			instance_create(0, 0, WaveMaker)
			repeat(10){
				with instance_create(0,0,FogEvent){
					x = irandom_range(50, room_width-50)
					y -= irandom(80)
					image_blend = merge_color(choose(c_gray, c_ltgray, c_gray), c_red, irandom(0.5)) 
				}
			}
		}
		
		Volcano.myState = "erupting"
	}

}


function EruptionWait() {
	Wait(1/4*Clock.fullDay, EruptionWaited, argument0)
	survived = argument0
}

function EruptionWaited(){
	global.moraleBoost = "volcano"
	if !argument0{
		ds_list_add(global.notificationList, "Ship tossed about!", "The dangerous waves have tossed the ship, damaging the ship and crew!")
		UpdateHealth(Ship, -irandom_range(75, 100))
		with Pirate
			UpdateHealth(id, -irandom_range(20, 30))
	}else{
		ds_list_add(global.notificationList, "Crew safe!", "The crew were able to overcome the dangerous waves without any damage!")
	}
	
	EventController.eventTimer = 0
}

function AppeaseWait(){
	Wait(1/8*Clock.fullDay, EruptionWaited, true)
}

function VolcanoEruptAppease(){
	if irandom(2) or Volcano.myState != "erupting"{
		ds_list_add(global.notificationList, "No affect!", "The volcano's rage was not satisfied, and lava continues to erupt from the mouth of the mountian.")
		EventController.eventTimer = 0
	}
	else{
		VolcanoEnding()
	}
}

function VolcanoEnding(){
	ds_list_add(global.notificationList, "Eruption over!", "The volcano settles, and the seas calm.#The sky clears, and the crew breath sighes of relief.")
	with Volcano
		event_user(1)
}

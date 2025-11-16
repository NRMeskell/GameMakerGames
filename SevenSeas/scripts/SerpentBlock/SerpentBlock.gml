function SerpentBlock(){
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, SerpentWait, SerpentSneak, SerpentScare)
	    ds_list_add(buttonStats, 0, 3, 2)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "wait for the serpent to leave", "sail past the serpent", "scare the serpent away")
        
	    global.allowSelect = false
	    captionText = "Giant Serpent!"
	    eventText = "The monster blocks the way, and seems to be waiting to see what the crew does."   
	    global.moraleBoost = "serpent"
	    }

	instance_create(0, 0, SerpentEvent)
}

function SerpentSneak(){
	if argument0{
		ds_list_add(global.notificationList, "serpent avoided!", "The crew are able to silently navigate around the serpent.")
	}else{
		ds_list_add(global.notificationList, "serpent attacks!", "The serpent attacks the ship, damaging the hull.")
		SerpentEvent.sprite_index = SerpentAttackSpr
		SerpentEvent.image_index = 0
		UpdateHealth(Ship, -100)
	}
}

function SerpentScare(){
	if argument0{
		ds_list_add(global.notificationList, "serpent scared!", "the sudden noise scares the monster away, clearing the path.")
		SerpentEvent.sink = true
	}else{
		ds_list_add(global.notificationList, "serpent attacks!", "The serpent attacks the ship, damaging the hull.")
		SerpentEvent.sprite_index = SerpentAttackSpr
		SerpentEvent.image_index = 0
		UpdateHealth(Ship, -100)
	}
}

function SerpentWait(){
	Wait(1/8*Clock.fullDay, SerpentWaited, argument0)
}

function SerpentWaited(){
	if irandom(3){
		SerpentEvent.sink = true 
		ds_list_add(global.notificationList, "serpent bored", "The serpent bores and sinks back into the sea.")
	}
	else{
		SerpentEvent.sprite_index = SerpentAttackSpr
		SerpentEvent.image_index = 0
		UpdateHealth(Ship, -100)
		ds_list_add(global.notificationList, "serpent attacks", "the serpent attacks the sitting ship before diving into the ocean.")
	}
}
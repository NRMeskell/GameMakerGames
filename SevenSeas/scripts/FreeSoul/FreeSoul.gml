function FreeSoul(){
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, FreeSpirit, LiftCurses) 
	    ds_list_add(buttonStats, 0, 0, 0)
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "free trapped spirit", "use to lift curses")
        
	    global.allowSelect = false
	    captionText = "Trapped Soul!"
	    eventText = "The ancient soul, trapped in a crystal prison. The soul can be let free, or used to lift the crew's curses."  
	    global.moraleBoost = "trapped soul" 
	    }
}


function FreeSpirit(){
	MapCreator.winCond[3] += 1
	audio_play_sound(SoulFreeSnd, 1, false)
	instance_create(Ship.drawX+irandom_range(-50, -10), Ship.drawY-50, Soul)
}
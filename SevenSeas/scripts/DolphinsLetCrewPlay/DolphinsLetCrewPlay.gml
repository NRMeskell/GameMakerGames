
function DolphinsStartPlaying(){
	Wait(Clock.fullDay/8, DolphinsLetCrewPlay, argument0)
}

function DolphinsLetCrewPlay() {
	result = irandom(5)
    
	if result < 5 - 2*(global.seaType == "sea of monsters") {
		if result < 7{
		    with Pirate 
		        {
		        UpdateMorale(1, global.JOLLY)
		        UpdateMorale(1, global.DARING) 
		        }

		    ds_list_add(global.notificationList, "The crew play!" , "they had a grand time with the dolphins")
		}
		else if result < 9{
		    with Pirate 
		        {
		        UpdateMorale(1, global.JOLLY)
		        UpdateMorale(1, global.DARING) 
		        }  
            
		    items = LoseRandomItems(irandom(instance_number(Pirate) div 3 + 1))

		    ds_list_add(global.notificationList, "The crew play!" , "they had a grand time with the dolphins, but some items be dropped:#" + items)
	    }
	}
	else
	    {
	    with Pirate 
	        if irandom(2) = 1
	            {
	            UpdateHealth(id, -30)
	            UpdateMorale(-2, -1)
	            }
            
	    captionText = "They be sharks!"
	    notiText = "some of the crew be attacked and injured!"
    
	    ds_list_add(global.notificationList, captionText, notiText)
	    }

	instance_destroy(Dolphins)
	script_execute(closeEventCode)






}

function PayTime() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
		crew = instance_number(Pirate)
	    buttonNumber = 3
	    ds_list_add(buttons, PayPoor, PayFair, PayWell)
	    ds_list_add(buttonStats, 0, 0, 0)
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, min(CargoAmount(0), 3*crew), 4*crew, 5*crew)
	    ds_list_add(buttonText, "pay the crew poorly", "pay the crew fairly", "pay the crew well")
        
	    global.allowSelect = false
	    captionText = "Crew Payment!"
    
	    eventText = "The crew demand their weekly pay." 
	    global.moraleBoost = "payment"  
	    }
    
	instance_create(0,0,ShipEvent)






}

function SilverwheelRelent() {
	if argument0{
		ds_list_add(global.notificationList, "Offer Accepted!", "Captain Silverwheel relents and offers a selection of equipment for you to choose from.")

		myLoot = ds_list_create()
		ds_list_add(myLoot, -1)
		GetRandomLoot(4, "Offer", [-1])

		with StoreObjectParent
		    selected = false
		with Store
		    allowManySelects = false

		with CaptainSilverwheel{
		    myVar += 2
		    event_user(1)
		}
	}
	else{
		AddReputation("repute", -1, "disrepect of silverwheel")
		ds_list_add(global.notificationList, "Silverwheel insulted!", "She sails away, annoyed that you disrespected her offer.")

	}
    
	script_execute(closeEventCode)



}

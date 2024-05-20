function MessyAllow() {

	ds_list_add(global.notificationList, "Crew relieved!", otherPirate.firstName + " is annoyed, but the cleaner members of the crew are relieved.")

	with otherPirate
		UpdateMorale(-2, -1)
		
	with Pirate{
		UpdateMorale(1, global.KEEN)
		UpdateMorale(1, global.JOLLY)
	}

}

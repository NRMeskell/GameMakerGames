function BugAllow() {

	ds_list_add(global.notificationList, "Bug killed!", myPirate.firstName + " is quite sure that helped " + otherPirate.firstName + " overcome their fears.")

	with otherPirate{
		UpdateMorale(-1, global.JOLLY)
		UpdateMorale(-2, global.KEEN)
		UpdateMorale(0, global.FEARSOME)
		UpdateMorale(1, global.DARING)
	}
}

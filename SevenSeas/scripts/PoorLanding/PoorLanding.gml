function PoorLanding() {
	ds_list_add(global.notificationList, "Poor landing!", "the ship smashes into the land, damaging the hull!")
	UpdateHealth(Ship, -100)
}

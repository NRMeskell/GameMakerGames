function SilverwheelDontPay() {
	ds_list_add(global.notificationList, "Silverwheel unhappy!", "She says she'll return later to see if you've changed your mind.") 

	CaptainSilverwheel.myVar += 2;
	script_execute(closeEventCode)
}

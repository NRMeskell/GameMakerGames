function SilverwheelPay() {
	ds_list_add(global.notificationList, "Silverwheel repayed!", "she accepts your payment, and wishes you either change or find yourself at the bottom of the sea.")

	instance_destroy(CaptainSilverwheel)
	script_execute(closeEventCode)



}

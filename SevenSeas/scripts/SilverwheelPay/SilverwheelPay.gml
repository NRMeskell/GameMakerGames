function SilverwheelPay() {
	ds_list_add(global.notificationList, "Silverwheel repaid!", "she graciously accepts your payment, and wishes you the best in your future sailing!")

	instance_destroy(CaptainSilverwheel)
	script_execute(closeEventCode)
}

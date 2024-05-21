function FrogKingPay() {
	ds_list_add(global.notificationList, "Payment Accepted!", "The king accepts the payment. He promises the militay will not attack your ship, but says he cannot control local attacks.")
	FrogKing.myState = "payment"
    
	script_execute(closeEventCode)
}

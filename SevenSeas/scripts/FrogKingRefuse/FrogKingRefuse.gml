function FrogKingRefuse() {
	
	if argument0{
		ds_list_add(global.notificationList, "Demands accepted!", "The Frog King allows you to sail freely, but will return if you linger too long.")
		FrogKing.myState = "free"
	}
	else{
		ds_list_add(global.notificationList, "Demands Refused!", "The Frog King in unhappy. He wonders if a little military encouragement will change your mind.")
		FrogKing.myState = "annoyed"
		}
    
	script_execute(closeEventCode)



}

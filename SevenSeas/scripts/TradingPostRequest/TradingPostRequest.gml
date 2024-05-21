function TradingPostRequest() {
	//intimidate

	if argument0
	    {
		GetRandomLoot(irandom_range(1,2), "OFFER", [2,3,4])
		ds_list_add(global.notificationList, "Request accepted!", "The post offers up a few supplies for your sailing.")
		}
	else
	    {
		ds_list_add(global.notificationList, "Request rejected!", "the trading post is insulted, and kicks out the crew!")
	    }

	script_execute(closeEventCode, 2)



}

function TradingPostRequest() {
	//intimidate

	if argument0
	    {
		if searchReputationType("repute")[0] > -1{
		    GetRandomLoot(irandom_range(2,4), "OFFER", [-1,2,3,4,5])
		    ds_list_add(global.notificationList, "Request accepted!", "The trading post gives supplies for the journey!")
			}
		else{
			GetRandomLoot(irandom_range(1,2), "OFFER", [2,3,4])
		    ds_list_add(global.notificationList, "Request accepted!", "only a few supplies are given on account of your " + searchReputationType("repute")[1] + ".")
		
			}
		}
	else
	    {
		if searchReputationType("fear")[0] < 3{
		    ds_list_add(global.notificationList, "Request rejected!", "the trading post is insulted, and kicks out the crew!")
			AddReputation("repute", -1, "insulting demands")
			}
		else{
			ds_list_add("compromise agreed!", "Although insulted, the post recalled stories of your crews " + searchReputationType("fear")[1] + ", and agreed to trade at discount prices.")
			GetRandomStore(irandom_range(3,8), "OFFERED TRADES")
			with StoreObjectItem
				cost = round(cost/2)
				
			AddReputation("repute", -1, "insulting demands")
			}
	    }

	script_execute(closeEventCode, 2)



}

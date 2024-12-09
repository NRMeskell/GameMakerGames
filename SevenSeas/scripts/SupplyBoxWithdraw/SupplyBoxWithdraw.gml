/// @description Check Barrel
function SupplyBoxWithdraw() {

	if argument0{
		ds_list_add(global.notificationList, "Code entered!", "The helmsman quickly cracks the box's code, and can withdraw supplies!")
		GetRandomLoot(irandom_range(0,3), "BOX CONTENTS", undefined)
	}
	else{
		ds_list_add(global.notificationList, "Wrong Code!", "After several failed attempts, a loaded bullet-trap fires and injures the crew!")
		with RandomPirate(){
			myHealth -= 20
			UpdateMorale(-1, -1)
			UpdateMorale(-1, global.KEEN)
		}
	}
	
	script_execute(closeEventCode)
}

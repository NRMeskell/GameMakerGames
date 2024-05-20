/// @description Check Barrel
function FloatingBarrelCheck() {

	result = irandom(10)

	if argument0{
		if result < 7
		    {
		    ds_list_add(global.notificationList, "the barrel is full of loot!", "it's is brought aboard by the crew")
			GetRandomLoot(irandom_range(0,2), "BARREL CONTENTS", undefined)
			instance_destroy(Barrel)
			}
		else
		    {
		    ds_list_add(global.notificationList, "The barrel was filled with rats!", "it's is allowed to float away")
			with Barrel
				floatAway = true
			}
	}    
	else{
		if result < 7
		    {
		    ds_list_add(global.notificationList, "label misread!", "The captain misidentified the barrel and let it float by.")
			UpdateMorale(-1, -1)
			UpdateMorale(-1, global.KEEN)
			
			with Barrel
				floatAway = true
			}
		else
		    {
		    ds_list_add(global.notificationList, "label misread!", "A barrel full of rats is let on board!")
			UpdateMorale(-1, -1)
			UpdateMorale(-1, global.KEEN)
			
			with instance_create(0,0,ConditionTimer)
		        condition = RatsEvent
				
			with Barrel
				instance_destroy()
			}
	}
	script_execute(closeEventCode)
}

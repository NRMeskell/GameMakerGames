/// @description Jury-rig
function RottenJuryRig() {

	if !argument0
	    with instance_create(0,0,ConditionTimer)
	        condition = RottedPlanks
        
	ds_list_add(global.notificationList, "Planks supported with scraps", "hopefully they will hold...")

        
	script_execute(closeEventCode, 2)
    



}

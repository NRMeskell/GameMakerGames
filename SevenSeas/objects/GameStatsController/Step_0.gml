/// @description Death
if !instance_exists(Defeat){
    //no more pirates
    defeat = false
    if instance_number(Pirate) == 0
        defeat = true
    
    //ship destroyed
    if Ship.myHealth < 1{
		instance_destroy(RealAttack)
        defeat = true
	}
        
    if defeat and !instance_exists(RealAttack) and ds_list_size(global.notificationList) == 0{
        instance_create(0,0,Defeat)
        }
    }



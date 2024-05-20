/// @description Death
if !instance_exists(Defeat){
    //no more pirates
    defeat = false
    if instance_number(Pirate) == 0
        defeat = true
    
    //all pirates injured   
    piratesInjured = true
    with Pirate
        if !injured
            other.piratesInjured = false
    if piratesInjured
        defeat = true
    
    //ship destroyed
    if Ship.myHealth < 1
        defeat = true
        
    if defeat and !instance_exists(RealAttack) and ds_list_size(global.notificationList) == 0{
        instance_create(0,0,Defeat)
        }
    }



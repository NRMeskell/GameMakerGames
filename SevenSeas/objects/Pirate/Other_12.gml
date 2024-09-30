/// @description Destroyed

mySlot.occupied = false
global.moraleBoost = "lost crew"   
UpdateMorale(-1 + 2*deserter, -1)
//if !deserter
//ds_list_add(global.notificationList, "Pirate Dead!", name + " died! The crew mourn their loss.")


ds_list_delete(global.crewList, ds_list_find_index(global.crewList, id))
global.crewSize --
        
instance_destroy()


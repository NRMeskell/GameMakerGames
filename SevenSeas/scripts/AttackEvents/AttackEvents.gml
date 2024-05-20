// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackEvents(){
	
	//boom stick explodes
	if myType == "ranged"{
		if irandom(20) == 0
		with ItemParent if image_index == 18 and myPirate.injured == false{	
			ds_list_add(global.notificationList, "Gun Explodes!", "A boomstick held by " + myPirate.firstName + " exploded, hurting the pirate and destroying the weapon!")
			with myPirate
				myHealth -= 20
			
			//destroy boomstick
			UnequipItem(id)
			while ds_list_find_index(ItemRunner.floatingItems, id) != -1
			    ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, self.id))   
			instance_destroy()
		}
	}
}
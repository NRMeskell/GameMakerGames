/// @description End Event
// You can write your code in this editor

event_inherited()

with KitchenCloser if myTask == global.DISHES{
	for(var i=0; i<10; i++){
		var shelf = myPlat[0]
		with instance_create_depth(irandom_range(shelf.x+10, shelf.x+60), shelf.y-5, shelf.depth-1, ActionParent){
			desireFilling = "none"
			exciting = false

			name = "dish"
			
			sprite_index = DishItemSpr
			image_index = i
			myGround = shelf
		}
	}
}

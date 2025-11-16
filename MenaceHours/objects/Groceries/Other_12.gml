/// @description End Event
// You can write your code in this editor

event_inherited()

instance_destroy(GroceryBag)

with FridgeDoor{
	for(var i=0; i<10; i++){
		var shelf = myPlat[irandom(2)]
		with instance_create_depth(irandom_range(shelf.x+10, shelf.x+40), shelf.y-5, shelf.depth-1, ActionParent){
			sprite_index = GroceryItemSpr
			image_index = irandom(5)
			myGround = shelf
			
			desireFilling = "eat"
			exciting = true

			name = "grocery"
		}
	}
}

with KitchenCloser if myTask == global.GROCERIES{
	for(var i=0; i<5; i++){
		var shelf = myPlat[0]
		with instance_create_depth(irandom_range(shelf.x+10, shelf.x+60), shelf.y-5, shelf.depth-1, ActionParent){
			desireFilling = "eat"
			exciting = true

			name = "grocery"
			
			sprite_index = GroceryItemSpr
			image_index = 3+irandom(5)
			myGround = shelf
		}
	}
}

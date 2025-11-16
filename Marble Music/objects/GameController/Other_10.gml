/// @description Add Target
// You can write your code in this editor

// Add Target
var box = getGameBox()
var tx = irandom_range(box[0] + 16, box[2] - 16), 
ty = irandom_range(box[1] + 16, box[3] - 16);
	
var close = instance_nearest(tx, ty, Target)
if instance_exists(close){
	var tries = 0
	while tries < 5 and point_distance(close.x, close.y, tx, ty) < 100 / sqrt(instance_number(Target)){
		tx = irandom_range(box[0] + 16, box[2] - 16); 
		ty = irandom_range(box[1] + 16, box[3] - 16);
		close = instance_nearest(tx, ty, Target);
		tries += 1
	}
	
}
	
instance_create_depth(tx, ty, 20, Target)
/// @description raise

var newEnemy = instance_create(0,0, choose(SkeletalCrew, SkeletalCrew, SkeletalCrewHealer))
for(var r=0; r<ds_list_size(newEnemy.myActions); r++){
	var newAction = instance_create(-50, -50, ds_list_find_value(newEnemy.myActions, r))
    newAction.myPirate = newEnemy
}
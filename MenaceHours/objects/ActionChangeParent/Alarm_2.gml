/// @description Do not snap anywhere
// You can write your code in this editor

for(var i=0; i<array_length(myPlat); i++){
	if instance_exists(myPlat[i])
		myPlat[i].available = false
}
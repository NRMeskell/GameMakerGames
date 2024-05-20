/// @description destroy light

for(i=0; i<array_length_1d(myLight); i++){
    if myLight[i] != noone{
        instance_destroy(myLight[i])
    }
	myLight[i] = noone
}

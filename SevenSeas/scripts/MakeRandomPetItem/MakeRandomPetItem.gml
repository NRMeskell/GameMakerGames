function MakeRandomPetItem(argument0) {
	preview = GeneratePetItem(argument0) 
	newItem = MakePetItem(preview) 
	instance_destroy(preview)

	return newItem 





}

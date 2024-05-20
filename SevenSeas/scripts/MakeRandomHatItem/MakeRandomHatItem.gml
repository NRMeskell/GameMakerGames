function MakeRandomHatItem(argument0) {

	preview = GenerateHatItem(argument0)
	newItem = MakeHatItem(preview)
	instance_destroy(preview)

	return newItem




}

function MakeRandomPantsItem(argument0) {
	preview = GeneratePantsItem(argument0)
	newItem = MakePantsItem(preview)
	instance_destroy(preview)

	return newItem




}

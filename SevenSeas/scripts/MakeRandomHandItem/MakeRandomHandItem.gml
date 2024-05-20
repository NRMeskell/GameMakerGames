function MakeRandomHandItem(argument0) {
	preview = GenerateHandItem(argument0)
	newItem = MakeHandItem(preview)
	instance_destroy(preview)

	return newItem




}

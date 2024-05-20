function MakeRandomShirtItem(argument0) {
	preview = GenerateShirtItem(argument0)
	newItem = MakeShirtItem(preview)
	instance_destroy(preview)

	return newItem




}

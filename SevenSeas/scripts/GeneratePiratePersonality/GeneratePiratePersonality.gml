function GeneratePiratePersonality() {
	myRequestList = ds_list_create()
	myMainPer = irandom(3)
	mySecondPerAdjuster = choose(-1,1)
	mySecondPer = ((myMainPer + mySecondPerAdjuster) + 4) mod 4

	myGoal = choose("love", "money", "adventure", "action")

	for(var i=0; i<2; i++){
		addRequest = EventController.requestLists[myMainPer][irandom(2)]
		while ds_list_find_index(myRequestList, addRequest) != -1
			addRequest = EventController.requestLists[myMainPer][irandom(2)]
		ds_list_add(myRequestList, addRequest)
	}
}

/// @description Speech Dictionaries
function GeneratePirateSpeech() {

	//Main Dicts found in SpeechController
	myPirateDict = ds_map_create()
	ds_map_copy(myPirateDict, SpeechController.pirateDict)

	var myFancyDict = SpeechController.pirateDicts[myMainPer]


	pirateTalkSize = irandom_range(ds_map_size(myFancyDict)/2, ds_map_size(myFancyDict))
	for(i=0; i<pirateTalkSize; i++)
	    {
	    currentKey = ds_map_find_first(myFancyDict)
	    rand = irandom(ds_map_size(myFancyDict))
	    for(r=0; r<rand; r++)
	        currentKey = ds_map_find_next(myFancyDict, currentKey)
        
	    if ds_map_find_value(myPirateDict, currentKey) != 0
	        ds_map_add(myPirateDict, currentKey, ds_map_find_value(myFancyDict, currentKey))
	    }
}

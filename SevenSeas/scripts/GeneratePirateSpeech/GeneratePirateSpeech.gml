/// @description Speech Dictionaries
function GeneratePirateSpeech() {

	//Main Dicts found in SpeechController
	myPirateDict = ds_map_create()
	ds_map_copy(myPirateDict, SpeechController.pirateDict0)


	pirateTalkSize = irandom(ds_map_size(SpeechController.pirateDict1))
	for(i=0; i<pirateTalkSize; i++)
	    {
	    currentKey = ds_map_find_first(SpeechController.pirateDict1)
	    rand = irandom(ds_map_size(SpeechController.pirateDict1))
	    for(r=0; r<rand; r++)
	        currentKey = ds_map_find_next(SpeechController.pirateDict1, currentKey)
        
	    if ds_map_find_value(myPirateDict, currentKey) != 0
	        ds_map_add(myPirateDict, currentKey, ds_map_find_value(SpeechController.pirateDict1, currentKey))
	    }




}

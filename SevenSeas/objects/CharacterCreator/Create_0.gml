/// @description Add Characters

characters = ds_list_create()
ds_list_add(characters, CoveCollector, JohnnyShortsticks, CaptainSilverwheel, FrogKing, GiantTurtle, OldGabbler, CrashingRocks, CurseLifter, SpiritLord)
characterNumber = ds_list_size(characters)

for(var i=0; i<characterNumber; i++){
    character = ds_list_find_value(characters, i)
    if !instance_exists(character){
        instance_create(-50, -50, character)
	with character
		event_user(0)
	}
}



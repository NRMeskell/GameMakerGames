/// @description Gone

with LoadGameMaker{
	DeleteSaveFile(ds_list_find_value(myGames, other.myEvent)[0])
    ds_list_delete(myGames, other.myEvent)
}


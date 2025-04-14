/// @description Give Items to Player Real

// resolve trades first
with StoreObjectTrade{
	if selected
		event_user(0)
}
// resolve cargo storing issues next (store unstored cargo types)
with StoreObjectStorable{
	if selected and !HasStored(itemNumber, 1){
		event_user(0)
	}
}
// resolve all unresolved transactions
with StoreObjectParent
    {
    if selected{
		event_user(0)
	}
}
audio_play_sound(StoreBuySnd, 1, false)
event_user(0)


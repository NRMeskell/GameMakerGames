/// @description Search for supplies


audio_play_sound(SearchingSnd, 1, false)
mySpecialAction = SearchSupplies
myAnimationTimes = [1/16*Clock.fullDay, room_speed*4]
myAnimation = [[x-20, x-20], [y-16, y-16], Searching]

if sprite_index = CampFireSpr
	sprite_index = CampFireDyingSpr
else
	sprite_index = CampFireDeadSpr
			
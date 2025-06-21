/// @description Resting
   
audio_play_sound(SleepingSnd, 1, false)
mySpecialAction = RestingCrew
myAnimationTimes = [1/16*Clock.fullDay, room_speed*2.5]
myAnimation = [[x-17, x-23], [y-16, y-16], Sleeping]

if sprite_index = CampFireSpr
	sprite_index = CampFireDyingSpr
else
	sprite_index = CampFireDeadSpr
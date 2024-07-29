/// @description Resting
   
mySpecialAction = RestingCrew
myAnimationTimes = [Clock.campTime div 4, room_speed*2]
myAnimation = [[x-17, x-23], [y-16, y-16], Sleeping]

if sprite_index = CampFireSpr
	sprite_index = CampFireDyingSpr
else
	sprite_index = CampFireDeadSpr
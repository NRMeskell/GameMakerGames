/// @description AnimateAction

if Clock.alarm[2] > myAnimationTimes[1]
	alarm[0] = myAnimationTimes[0]

with instance_create(irandom_range(myAnimation[0][0], myAnimation[0][1]), irandom_range(myAnimation[1][0], myAnimation[1][1]), myAnimation[2]){
    myCamp = other.id
    }


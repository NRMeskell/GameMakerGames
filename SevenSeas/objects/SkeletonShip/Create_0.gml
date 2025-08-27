/// @description Add vars and looks

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myShipHull = SkeletalShipSpr
flagColor = c_white
flagSprite = SkeletalFlagSpr


///Common enemy vars

name = "Skeletal Ship"
maxHealth = irandom_range(200, 300) div 1
myHealth = maxHealth
image_index = 0 
enemyLevel = 0

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicCannonAction, BasicShipAction)


instance_create(0,0,SkeletalCaptain)

if (irandom(1))
	instance_create(0,0, SkeletalCrewHealer)

repeat(choose(3,4)-instance_number(Enemy))
    instance_create(0,0,SkeletalCrew)
 

event_user(2)


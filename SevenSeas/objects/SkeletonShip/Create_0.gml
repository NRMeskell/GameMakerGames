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
maxHealth = irandom_range(300, 500) div 1
myHealth = maxHealth
image_index = 0 
enemyLevel = 0

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicCannonAction, BasicShipAction)


instance_create(0,0,SkeletalCaptain)

repeat(choose(1,3))
    instance_create(0,0,SkeletalCrew)
	
if (instance_number(Enemy) == 2) or (instance_number(Enemy) == 3 and irandom(1))
	instance_create(0,0, SkeletalCrewHealer)
 

event_user(2)


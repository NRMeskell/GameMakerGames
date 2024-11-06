/// @description Add vars and looks

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myShipHull = SpiritLordShipSpr
flagColor = c_white
flagSprite = SkeletalFlagSpr


///Common enemy vars

name = "Spirit Lord Ship"
maxHealth = 800
myHealth = maxHealth
image_index = 0 
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicCannonAction, BasicShipAction)


instance_create(0,0,SpiritLordEnemy)
instance_create(0,0,SkeletalCaptain)

if (irandom(1))
	instance_create(0,0, SkeletalCrewHealer)

repeat(choose(3,4)-instance_number(Enemy))
    instance_create(0,0,SkeletalCrew)

event_user(2)


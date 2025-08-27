/// @description Add vars and looks

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myShipHull = SkeletalCollectorsSpr
flagColor = c_ltgray
flagSprite = PirateCollectorFlag
shipFocus = "cannon"

///Common enemy vars

name = "Skeletal Hardcoin"
maxHealth = (400 + 50*random_range(0.75,1.5)) div 1
myHealth = maxHealth
image_index = 0 
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicCannonAction, BasicShipAction)

instance_create(0,0,EnemyZombieCollector)

repeat(2)
	instance_create(0,0,SkeletalCrewHealer)

repeat(2)
    instance_create(0,0,SkeletalCrew)


event_user(2)


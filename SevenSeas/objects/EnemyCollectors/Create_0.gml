/// @description Add vars and looks

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myShipHull = PirateCollectorsSpr
flagColor = c_white
flagSprite = PirateCollectorFlag
shipFocus = "cannon"

///Common enemy vars

name = "Captain Hardcoin"
maxHealth = (125 + 50*random_range(0.75,1.5)) div 1
myHealth = maxHealth
image_index = 0 
enemyLevel = 0

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicCannonAction, BasicShipAction)

instance_create(0,0,EnemyCollector)

instance_create(0,0,EnemyCannonier)

repeat(2)
    instance_create(0,0,EnemyPirate)


event_user(2)


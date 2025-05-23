/// @description Add vars and looks

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myShipHull = SilverwheelShipSpr
flagColor = c_white
flagSprite = SilverwheelFlagSpr

///Common enemy vars

shipFocus = "jack"
name = "Captain Silverwheel"
maxHealth = (50 + 50*random_range(0.75,1.5)) div 1
myHealth = maxHealth
image_index = 0
enemyLevel = 0

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicCannonAction, BasicShipAction)


instance_create(0,0,EnemySilverwheel)
instance_create(0,0,EnemyCannonier)
repeat(2)
    instance_create(0,0,EnemyPirate)

event_user(2)


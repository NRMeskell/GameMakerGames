/// @description Add vars and looks

farDistance = 135
myShipType = 1

flagX = sprite_get_xoffset(TropicalShipSpr) - 47
flagY =  9 - sprite_get_yoffset(TropicalShipSpr)

myShipHull = FrogShipRoyalSpr

flagColor = make_color_rgb(45,133,45)
flagSprite = TropicalFlagSpr

///Common enemy vars

name = "Tropical Kingdom Military Ship"
maxHealth = 200
myHealth = maxHealth
image_index = 1
enemyLevel = 2

myBasicActions = ds_list_create()

ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicCannonAction, BasicShipAction)

//Create Crew
instance_create(0,0,EnemyFrogCaptain)
instance_create(0,0,EnemyRoyalFrogCannon)
instance_create(0,0,choose(EnemyRoyalFrogCrew, EnemyRoyalFrogCannon))
instance_create(0,0,EnemyRoyalFrogCrew)
instance_create(0,0,choose(EnemyFrogCrew,EnemyFrogGunner))

event_user(2)


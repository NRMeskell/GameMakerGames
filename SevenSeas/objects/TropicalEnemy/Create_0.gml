/// @description Add vars and looks

farDistance = 135
myShipType = 0

myShipHull = TropicalShipSpr

flagColor = make_color_rgb(45,133,45)
flagSprite = TropicalFlagSpr

///Common enemy vars

name = "Tropical Frog Ship"
maxHealth = 200
myHealth = maxHealth
image_index = 1
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicCannonAction, BasicShipAction)

//Create Crew
instance_create(0,0,EnemyFrogCaptain)

if instance_exists(FrogKing)
    if FrogKing.myState == "war"
        instance_create(0,0,EnemyRoyalFrogCrew)

instance_create(0,0,choose(EnemyFrogGunner, EnemyFrogCannon))
instance_create(0,0,choose(EnemyFrogGunner, EnemyFrogCrew))  
instance_create(0,0, EnemyFrogCrew)

event_user(2)


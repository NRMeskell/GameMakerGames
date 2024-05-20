/// @description Add vars and looks

farDistance = 135
myShipType = 0

flagX = sprite_get_xoffset(TropicalShipSpr) - 55
flagY = 10 - sprite_get_yoffset(TropicalShipSpr)

myShipHull = TropicalShipSpr

flagColor = make_color_rgb(45,133,45)
flagSprite = TropicalFlagSpr

///Common enemy vars

name = "Tropical Cannoneer-Ship"
maxHealth = 200
myHealth = maxHealth
image_index = 1
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicCannonAction, BasicShipAction)

//Create Crew
instance_create(0,0, EnemyFrogCrew)
instance_create(0,0,EnemyFrogGunner)  
instance_create(0,0,EnemyFrogCannon)

if instance_exists(FrogKing)
    if FrogKing.myState == "war"
        instance_create(0,0,EnemyRoyalFrogCrew)
    
instance_create(0,0,EnemyFrogCaptain)

event_user(2)


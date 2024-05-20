/// @description Add vars and looks

farDistance = 135
myShipType = 1

flagX = sprite_get_xoffset(TropicalSwordShipSpr) - 47
flagY =  9 - sprite_get_yoffset(TropicalSwordShipSpr)

myShipHull = TropicalSwordShipSpr

flagColor = make_color_rgb(45,133,45)
flagSprite = TropicalFlagSpr

///Common enemy vars

name = "Tropical Boarding-Ship"
maxHealth = 150
myHealth = maxHealth
image_index = 1
enemyLevel = 1

myBasicActions = ds_list_create()

ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicShipAction)

//Create Crew

repeat(2)
    instance_create(0,0,EnemyFrogCrew)
instance_create(0,0,EnemyFrogGunner)
    
if instance_exists(FrogKing)
    if FrogKing.myState == "war"
        instance_create(0,0,EnemyRoyalFrogCrew)
        
instance_create(0,0,EnemyFrogCaptain)
event_user(2)


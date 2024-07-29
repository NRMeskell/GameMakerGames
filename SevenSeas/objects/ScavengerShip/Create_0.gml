/// @description Add vars and looks

farDistance = 135
myShipType = 0

flagX = sprite_get_xoffset(ScavengerShipSpr) - 55
flagY = 10 - sprite_get_yoffset(ScavengerShipSpr)

myShipHull = ScavengerShipSpr

flagColor = c_white
flagSprite = ScavengerFlagSpr

///Common enemy vars

name = "Scavenger Ship"
maxHealth = 150 + irandom(50) div 5 * 5
myHealth = maxHealth
image_index = 1
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicCannonAction, BasicShipAction)

//Create Crew
repeat(choose(2,3))
	instance_create(0,0,ScavengerCrew)
	
if instance_number(ScavengerCrew) < 3 and irandom(1)
	instance_create(0,0, ScavengerSniper)
    
instance_create(0,0, ScavengerCaptian)

event_user(2)


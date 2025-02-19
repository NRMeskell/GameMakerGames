/// @description Add vars and looks

farDistance = 135
myShipType = 0

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
instance_create(0,0, ScavengerCaptian)

if irandom(1)
	instance_create(0,0, ScavengerSniper)

repeat(choose(2,4-instance_number(Enemy)))
	instance_create(0,0,ScavengerCrew)
	
	
event_user(2)


/// @description Add vars and looks

currentDistance = 0
farDistance = 135
myShipType = 0

myShipHull = SketchyShipSpr

flagColor = c_white
flagSprite = ScavengerFlagSpr

///Common enemy vars

name = "Sketchy Merchant Ship"
maxHealth = 250
myHealth = maxHealth
image_index = 1
enemyLevel = 2

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicCannonAction, BasicShipAction)
shipFocus = "cannon"

//Create Crew
instance_create(0,0, SketchyCaptian)
instance_create(0,0, EnemyCaptain)

instance_create(0,0, ScavengerSniper)
instance_create(0,0, ShipGaurd)
instance_create(0,0, ScavengerCrew)
	
event_user(2)

/// @description Add vars and looks

myShipHull = LavaShipSpr
flagColor = c_white
flagSprite = LavaFlagSpr

///Common enemy vars

name = "Volcanic Traders"
maxHealth = 175
myHealth = maxHealth
image_index = 1
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicShipAction)


with instance_create(0,0,MerchantCaptain){
	ds_list_add(myActions, CauseChaosAction)
	image_index = 25
}
repeat(2)
	instance_create(0,0,ShipGaurd)
repeat(2)
	with instance_create(0,0,MerchantCrew){
		image_index = 26
		ds_list_add(myActions, choose(HeavyBoardingAction, HoldFastAction, ScoutingAction))
	}

event_user(2)


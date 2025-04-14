/// @description Add vars and looks

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myShipTypes[0] = choose(0,0,0)
myShipTypes[1] = choose(1,2,3)
myShipTypes[2] = choose(4,5,6)
myShipTypes[3] = choose(4,5,6)

shipType = myShipTypes[global.seaLevel]
myShipHull = global.hullDict[shipType]
flagColor = c_dkgray
flagSprite = PirateFlagSpr
shipFocus = choose("jack", "melee", "cannon")


///Common enemy vars

name = "Rival Pirate Ship"
maxHealth = (50 + 50*(global.seaLevel+1)*random_range(0.75,1.5)) div 1
myHealth = maxHealth
image_index = 0 
enemyLevel = 0

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMeleeAction, BasicRangedAction, BasicCannonAction, BasicShipAction)


//Crew
pirateCrew[0] = EnemyPirate
pirateCrew[1] = EnemyPirate
pirateCrew[2] = ShipGaurd
pirateCrew[3] = EnemyCannonier

piratePirate[0] = EnemyCaptain
piratePirate[1] = EnemyCaptain
piratePirate[2] = EnemyAdmiral
piratePirate[3] = EnemyAdmiral

crewSize = irandom_range((global.seaLevel + 2), (global.seaLevel + 1)*2 + 1)
   
instance_create(0,0,piratePirate[irandom(global.seaLevel)])

repeat(global.seaLevel+2)
    instance_create(0,0,pirateCrew[irandom(global.seaLevel)])

event_user(2)


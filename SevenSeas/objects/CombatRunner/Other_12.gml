/// @description Vars

wantsClose = false
startX = room_width - sprite_get_width(EnemyFrameSpr)*1.2
startY = sprite_height*1.1

x = startX
y = startY

sinkY = 0
sinkRotate = 0 
runAway = false
showSkipButton = false

image_speed = 0

closeRangeView = 0
surrender = false
lootMod = 1

totalVar = 2*global.gameDiff + 2
//Update Difficulty
enemyPower = irandom_range(totalVar/2-1,totalVar/2+1)

enemyNumber = round(instance_number(Enemy)*(enemyPower+3)/5)
change = enemyNumber - instance_number(Enemy)
for (i = 0; i<abs(change); i++){
	foundDup = false
	while !foundDup{
		dupEnemy = instance_find(Enemy, irandom(instance_number(Enemy)-2))
		with Enemy
			if x < other.dupEnemy.x{
				if other.change > 0
					x -= xGap
				else
					x += xGap
					
				other.foundDup = true
			}
	}
	
	if change > 0
		with instance_create(0, dupEnemy.y, dupEnemy.object_index)
			x = other.dupEnemy.x - xGap
	else
		instance_destroy(dupEnemy)
}
	
maxHealth = round(maxHealth * ((totalVar - enemyPower)+3)/5)
myHealth = maxHealth

///Action Map
/*
actionTypeMap = ds_map_create()
ds_map_add(actionTypeMap, ShipSwordAttack, "melle")
ds_map_add(actionTypeMap, ShipHeavyBoardingAttack, "melle")
ds_map_add(actionTypeMap, ShipSwarmAttack, "melle")
ds_map_add(actionTypeMap, ShipHammerAttack, "melle")
ds_map_add(actionTypeMap, ShipScoutAttack, "melle")
ds_map_add(actionTypeMap, ShipFinishingAttack, "melle")
ds_map_add(actionTypeMap, ShipHoldFastAttack, "melle")

ds_map_add(actionTypeMap, ShipGunAttack, "ranged")
ds_map_add(actionTypeMap, ShipBarrageAttack, "ranged")
ds_map_add(actionTypeMap, ShipLookoutAttack, "ranged")
ds_map_add(actionTypeMap, ShipChaosAttack, "ranged")
ds_map_add(actionTypeMap, ShipSniperAttack, "ranged")
ds_map_add(actionTypeMap, ShipTargetedAttack, "ranged")

ds_map_add(actionTypeMap, ShipWarningAttack, "cannon")
ds_map_add(actionTypeMap, ShipCannonAttack, "cannon")
ds_map_add(actionTypeMap, BroadsideAttack, "cannon")
ds_map_add(actionTypeMap, SprayAttack, "cannon")

ds_map_add(actionTypeMap, ShipShipChange, "ship")
ds_map_add(actionTypeMap, ShipOutmaneuver, "ship")
ds_map_add(actionTypeMap, ShipRamming, "ship")
*/
///Create Action Runners

indexType[0] = "melle"
indexType[1] = "ranged"
indexType[2] = "cannon"
indexType[3] = "ship"

startX = 256
startY = 135
yGap = sprite_get_height(PlayerAttacksSpr) + 2


for(i=0;i<4;i++)
    {
    with instance_create(startX, startY + yGap*i, PlayerActionRunner)
        {
        myType = other.indexType[other.i]
        image_index = other.i
        }
    }

///Create Player Actions

actionList = ds_list_create()
turnCounter = 0
playerTurn = true

basicMelleAttack = instance_create(-100,-100,BasicMelleAction)
basicRangedAttack = instance_create(-100,-100,BasicRangedAction)
basicCannonAttack = instance_create(-100,-100,BasicCannonAction)
basicShipChange = instance_create(-100,-100,BasicShipAction)
basicShipRun = instance_create(-100,-100, BasicRunAction)

basicMelleAttack.myPirate = Ship
basicRangedAttack.myPirate = Ship
basicCannonAttack.myPirate = Ship
basicShipChange.myPirate = Ship
basicShipRun.myPirate = Ship

for(i=0; i<instance_number(Pirate); i++)
    {
    checkPirate = instance_find(Pirate,i)
    for(r=0; r<3; r++)
        {
        if checkPirate.myAction[r] != noone
            {
            with instance_create(-100,-100, checkPirate.myAction[r])
                {
                myPirate = other.checkPirate
                }
            }
        }
    if checkPirate.myPet.myAction != noone
        {
        with instance_create(-100,-100, checkPirate.myPet.myAction)
            {
            myPirate = other.checkPirate
            }
        }
    }



///Create Enemy Actions

enemyActionList = ds_list_create()
desireList = ds_list_create()
possibleEnemyActions = ds_list_create()

for(i=0; i<ds_list_size(myBasicActions); i++)
    with instance_create(-50, -50, ds_list_find_value(myBasicActions, i))
            myPirate = other.id
            
for(i=0; i<instance_number(Enemy); i++)
    {
    checkEnemy = instance_find(Enemy,i)
    for(r=0; r<ds_list_size(checkEnemy.myActions); r++)
        {
        if object_is_ancestor(ds_list_find_value(checkEnemy.myActions, r), ActionParent)
        with instance_create(-50, -50, ds_list_find_value(checkEnemy.myActions, r))
            myPirate = other.checkEnemy
        }
    }



///Combat Vars

overEndTurnButton = false

playerTurn = true
timerLength = room_speed * 5
canEndTurn = false
closeRange = false
combatView = false

farDistance = 135
closeDistance = 75
currentDistance = 0

healthDiff = 0
updateHealthDiff = false
healthDiffTimer = 0


myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

playerTurnDamage = 0
enemyTurnDamage = 0
playerDamage = 0
enemyDamage = 0
turns = 1
averagePlayerDam = 0
averageEnemyDam = 0

allowShipActions = true
allowMelleActions = true
allowRangedActions = true
allowCannonActions = true

playerPriority = -1
enemyPriority = -1

enemyTurnsLeft = 1000
playerTurnsLeft = 1000

global.moraleBoost = "combat"

with Pirate
    UpdateMorale(1, global.FEARSOME)
    

///Begin Game
event_user(0)
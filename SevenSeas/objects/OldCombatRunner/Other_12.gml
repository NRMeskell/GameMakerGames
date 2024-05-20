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

///Action Map

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

///Create Actions

actionList = ds_list_create()
turnCounter = 0
playerTurn = true

basicMelleAttack = instance_create(-100,-100,BasicMelleAction)
basicRangedAttack = instance_create(-100,-100,BasicRangedAction)
basicCannonAttack = instance_create(-100,-100,BasicCannonAction)
basicShipChange = instance_create(-100,-100,BasicShipAction)
basicShipRun = instance_create(-100,-100, BasicRunAction)

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



///Combat Vars

overEndTurnButton = false

playerTurn = true
timerLength = room_speed * 5
canEndTurn = false
closeRange = false

closeDistance = 100
currentDistance = 0

healthDiff = 0
updateHealthDiff = false
healthDiffTimer = 0


myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

myBasicActions = ds_list_create()

basicMelleActions = ds_list_create()
basicRangedActions = ds_list_create()
basicCannonActions = ds_list_create()
basicShipActions = ds_list_create()

specialShipActions = ds_list_create()
specialMelleActions = ds_list_create()
specialRangedActions = ds_list_create()
specialCannonActions = ds_list_create()

playerDamage = 0
enemyDamage = 0
turns = 1
averagePlayerDam = 0
averageEnemyDam = 0

enemyTurnsLeft = 1000
playerTurnsLeft = 1000

event_user(6)

global.moraleBoost = "combat"

with Pirate
    UpdateMorale(1, global.FEARSOME)


    

///Update Action Type Map

event_user(1)


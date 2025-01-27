/// @description Vars

instance_destroy(ActionParent)

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

//Update Difficulty
maxHealth = maxHealth
myHealth = maxHealth
healthDiff = maxHealth

///Create Action Runners

indexType[0] = "melee"
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
stunned = false
hasPlayerAttack = false
hasEnemyAttack = false

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
    with instance_create(-50, -50, ds_list_find_value(myBasicActions, i)){
		myPirate = CombatRunner.id
	}
            
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
    
overAction[0] = false

///Begin Game
event_user(0)
/// @description Wait for turn and refresh stuff

if instance_exists(Event) or ds_list_size(global.notificationList) > 0{
    alarm[2] = 20
    exit
}

//refresh stuff

if closeRange
    currentDistance = closeDistance
else
    currentDistance = 0
    
with EffectParent
    {
    duration -= 1
    if duration < 0
        instance_destroy()
    }
    
canEndTurn = false
playerTurn = true
with PlayerActionRunner
    {
    canUseActions = true
    visible = true
    }

///Try surrendering

turns ++
playerAverage = playerDamage/turns
enemyAverage = enemyDamage/turns

enemyHealth = 0
pirateHealth = 0
with Enemy
    other.enemyHealth += myHealth
    
with Pirate
    other.pirateHealth += myHealth

enemyTurnsLeft = min(myHealth/(playerAverage + 1), enemyHealth/(playerAverage + 1))
playerTurnsLeft = min(Ship.myHealth/(enemyAverage + 1), pirateHealth/(enemyAverage + 1))

surrenderChance = (power(1/enemyTurnsLeft, 2)) / (power(1/min(playerTurnsLeft, 2), 1/4))*irandom(1.25)

//Decide how much cargo to surrender
displayAmount = "1/2"
amount = 1/2

if random(1) < surrenderChance and enemyLevel == 0{
    with instance_create(0,0,SurrenderOption)
        {
        caption = CombatRunner.name + " surrenders!"
        text = "The enemy will give up half their cargo#and the crew will gain morale!"
        myEvent = 0
        amount = other.amount
        }
    }

///Update Action Stats

event_user(1)

with ActionParent{
    if waitLeft > 0
        waitLeft -= 1
    myTarget = noone
    }

for(i=0; i<ds_list_size(actionList); i++)
    {
    myAction = ds_list_find_value(actionList, i)
    
    with myAction{
        visible = true
        canUse = true
        myTarget = noone
        selected = false
        priority = irandom_range(priorityMin, priorityMax)
        }
    }



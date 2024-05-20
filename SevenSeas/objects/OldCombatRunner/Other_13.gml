/// @description Try surrendering

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

surrenderChance = (power(1/enemyTurnsLeft, 4)) / (power(1/min(playerTurnsLeft, 4), 1/4))*irandom(1.25)

//Decide how much cargo to surrender
if surrenderChance < 1/4{
    displayAmount = "1/4"
    amount = 1/4}
else {
    displayAmount = "1/2"
    amount = 1/2
    }

if random(1) < surrenderChance{
    with instance_create(0,0,SurrenderOption)
        {
        caption = CombatRunner.name + " surrenders!"
        text = "they offer " + other.displayAmount + " of their ship's cargo as a prize.#Accept their offer?"
        myEvent = 0
        amount = other.amount
        }
    }


///Switch to player turn

if closeRange
    currentDistance = 100
else
    currentDistance = 0

playerTurn = true
canEndTurn = false
event_user(1)
with PlayerActionRunner
    {
    canUseActions = true
    visible = true
    }
    
with ActionParent
    {
    visible = true
    selected = false
    canUse = true
    myTarget = noone
    }
    
with Enemy
    {
    targeted = false
    if irandom(1)
        {
        stunned = false
        }   
    if random(1) < 0.25
        {
        exposed = false
        bleeding = false
        }
    }
    
with EffectParent
    {
    if team = "enemy"
        {
        duration -= 1
        if duration < 0
            instance_destroy()
        }
    }
    
with Enemy
    if bleeding
        myHealth = (myHealth*0.75) div 1


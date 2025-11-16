/// @description Dead

if myHealth < 1
    event_user(5)
    
//Update Health
if abs(healthDiff - myHealth) > 1
    {
    if !updateHealthDiff
        healthDiffTimer ++
        
    if healthDiffTimer > room_speed*Pirate.healthTimer
        updateHealthDiff = true
        
    if updateHealthDiff
        healthDiff += sign(myHealth - healthDiff)*maxHealth/60
    }
else
    {
    healthDiff = myHealth
    updateHealthDiff = false
    healthDiffTimer = 0
    }


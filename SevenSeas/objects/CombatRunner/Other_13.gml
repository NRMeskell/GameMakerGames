/// @description Check Death

if alarm[0] != -1 or instance_exists(Defeat){
    with RealAttack
        instance_destroy()
    combatView = false
    exit;
    }

with (CombatRunner) {
///Run Turn

maxPri = -1
firstAttack = noone
with RealAttack{
    if priority >= other.maxPri{
        other.maxPri = priority
        other.firstAttack = id
        }
    }

if firstAttack != noone{
    with firstAttack
        {
        skip = false
        if (actionType == "cannon" and CombatRunner.closeRange)
            skip = true
        if (actionType == "melle" and !CombatRunner.closeRange)
            skip = true
        if (actionType == "ship" and CombatRunner.myStats[3] == 0)
            skip = true
        if !instance_exists(myPirate)
            skip = true
            
        if !skip{
            alarm[2] = 5
            }
        else{
            instance_destroy()
            
            with other
                event_user(3)
            }
        }
    }
else{
    combatView = false
    event_user(0)
    }

}

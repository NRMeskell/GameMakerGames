/// @description Run Turn

if alarm[0] != -1 or instance_exists(Defeat){
    with RealAttack
        instance_destroy()
    combatView = false
    exit;
    }

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
		if (!instance_exists(myPirate))
			skip = true;
        else if (actionType == "cannon" and CombatRunner.closeRange)
            skip = true;
        else if (actionType == "melle" and !CombatRunner.closeRange)
            skip = true;
        else if (actionType == "ship" and ((myPirate.object_index == Enemy or myPirate.object_index == CombatRunner) and CombatRunner.myStats[3] == 0))
            skip = true;
		else if (actionType == "ship" and global.totalWheelBonus == 0)
            skip = true;
		else if (myPirate.object_index != CombatRunner and myPirate.object_index != Ship) and myPirate.stunned == true
			skip = true;
            
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



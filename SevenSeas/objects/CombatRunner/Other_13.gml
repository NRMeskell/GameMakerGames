/// @description Run Turn


if alarm[0] != -1 or instance_exists(Defeat){
    with RealAttack
        instance_destroy()
    combatView = false
    exit;
    }

///Run Turn

var maxPri = -1
firstAttack = noone
with RealAttack{
    if priority >= maxPri{
        maxPri = priority
        other.firstAttack = id
        }
    }

if firstAttack != noone{
	with firstAttack.myButton
		event_user(3)
		
    with firstAttack
        {	
        if myButton.canUse and !myButton.warning{
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



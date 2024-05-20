/// @description Sand

inSand = (collision_line(x, y, x, y+1, SandParent, true, false) or collision_line(x, y, x, y+1, GreenParent, true, false)) and !collision_line(x, y, x, y+1, GrassDrawer, true, false)

///Set up for shot

if ready{
    if place_meeting(x,y,CharacterCollider){
        for(i=0; i<instance_number(CharacterCollider); i++){
            currentLimb = instance_find(CharacterCollider, i)
            if currentLimb.myCharacter = myCharacter
            if place_meeting(x,y,currentLimb){
                with myCharacter
                    event_user(1)
                }
            }
        }
    }


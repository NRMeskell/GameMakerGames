/// @description Hit into hole

for(i=0; i<360; i+=360/12)
    {
    with instance_create(x,y,ExplotionParticle)
        {
        image_blend = other.myColor
        physics_apply_impulse(x,y, 0.3*random_range(0.005, 0.01)*cos(degtorad(other.i))*sqrt(global.timeDiff), 0.3*random_range(0.005, 0.01)*sin(degtorad(other.i))*sqrt(global.timeDiff))
        }
    }

with myCharacter{
    inHole = true
    if CharacterCreator.gamemode == CharacterCreator.gamemodes[3]{
        ds_list_replace(CharacterCreator.scores, playerNumber, ds_list_size(CharacterCreator.scores) - instance_number(CharacterController) + 1)
        
        }
    instance_destroy(myClub)
    event_user(0)
    }
    
if CharacterCreator.alarm[2] == -1
    CharacterCreator.alarm[2] = CharacterCreator.startingScore*600
    
myBounceSnd = RockBounceSound
event_user(2)

instance_destroy()


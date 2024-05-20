/// @description Explode

exObject[0] = CharacterBody
exObject[1] = DodgeBallParent
exObject[2] = GolfBall
exObject[3] = Chicken


for(i=0; i<array_length_1d(exObject); i++)
    {
    if object_get_physics(exObject[i])
        {
        with CharacterBody
            {
            explodeDirection = point_direction(other.x, other.y, x, y)
            explodeDistance = point_distance(other.x, other.y, x, y)
            
            if explodeDistance < 20*(1+other.super)
                explodeForce = 2*sqrt(global.timeDiff)*(1+1.5*other.super)
            else if explodeDistance < 50*(1+other.super)
            explodeForce = 1*sqrt(global.timeDiff)*(1+1.5*other.super)
            else if explodeDistance < 150*(1+other.super)
                explodeForce = 0.5*sqrt(global.timeDiff)*(1+1.5*other.super)
            else
                explodeForce = 0
            
            if explodeForce > 0.1
                {
                physics_apply_impulse(x, y, explodeForce*cos(degtorad(-explodeDirection)), explodeForce*sin(degtorad(-explodeDirection)))
                if object_index = CharacterBody
                    myCharacter.hitBy = other.thrower   
                }
            }
        }
    }
    
for(i=0; i<360; i+=360/(6*(1+super)))
    {
    with instance_create(x,y,ExplotionParticle)
        {
        image_blend = choose(c_black, c_white, c_green, c_lime)
        physics_apply_impulse(x,y, random_range(0.005, 0.01)*cos(degtorad(other.i))*sqrt(global.timeDiff)*(1+other.super), random_range(0.005, 0.01)*sin(degtorad(other.i))*sqrt(global.timeDiff)*(1+other.super))
        }
    }
    
myEpl = audio_play_sound(PopSound, 1, false)
audio_sound_gain(myEpl, 0.6, 0)
        
        
instance_destroy()


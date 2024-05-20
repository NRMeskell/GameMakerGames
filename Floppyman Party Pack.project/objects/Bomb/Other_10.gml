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
            
            if explodeDistance < 20
                explodeForce = 3*sqrt(global.timeDiff)
            else if explodeDistance < 50
            explodeForce = 1.5*sqrt(global.timeDiff)
            else if explodeDistance < 150
                explodeForce = 0.5*sqrt(global.timeDiff)
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
    
for(i=0; i<360; i+=360/15)
    {
    with instance_create(x,y,ExplotionParticle)
        {
        image_blend = choose(c_black, c_gray, c_yellow, c_red, c_orange)
        physics_apply_impulse(x,y, random_range(0.005, 0.01)*cos(degtorad(other.i))*sqrt(global.timeDiff), random_range(0.005, 0.01)*sin(degtorad(other.i))*sqrt(global.timeDiff))
        }
    }
    
    
myEpl = audio_play_sound(BombExplosionSound, 1, false)
audio_sound_gain(myEpl, 0.8, 0)
        
        
instance_destroy()


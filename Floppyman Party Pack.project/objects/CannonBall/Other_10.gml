/// @description Explode

object[0] = CharacterBody
object[1] = DodgeBallParent
object[3] = Chicken




for(i=0; i<array_length_1d(object); i++)
    {
    with object[i]
        {
        
        explodeDirection = point_direction(other.x, other.y, x, y)
        explodeDistance = point_distance(other.x, other.y, x, y)
        
        if explodeDistance < 50
            explodeForce = 8
        else if explodeDistance < 100
			explodeForce = 4
        else if explodeDistance < 200
            explodeForce = 2
        else if explodeDistance < 300
            explodeForce = 1
        else
            explodeForce = 0
        
        if explodeForce > 0.1
            {
            physics_apply_impulse(x, y, explodeForce*sqrt(global.timeDiff)*cos(degtorad(-explodeDirection)), explodeForce*sqrt(global.timeDiff)*sin(degtorad(-explodeDirection)))
            }
        }
    }
    
for(i=0; i<360; i+=360/60)
    {
    with instance_create(x,y,ExplotionParticle)
        {
        image_blend = choose(c_black, c_gray, c_yellow, c_red, c_orange)
        physics_apply_impulse(x,y, random_range(0.005, 0.01)*sqrt(global.timeDiff)*cos(degtorad(other.i)), random_range(0.005, 0.01)*sqrt(global.timeDiff)*sin(degtorad(other.i)))
        }
    }
    
myEpl = audio_play_sound(HugeExplosionSound, 1, false)
audio_sound_gain(myEpl, 1, 0)

instance_destroy()


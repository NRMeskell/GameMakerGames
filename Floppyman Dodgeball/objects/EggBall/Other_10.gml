/// @description Explode

//object[1] = DodgeBallParent
//object[2] = CharacterArm
//object[3] = CharacterHead
//object[4] = CharacterLeg
    
for(i=0; i<360; i+=360/5)
    {
    with instance_create(x,y,ExplotionParticle)
        {
        image_blend = choose(c_white, c_white, c_white, c_yellow, c_orange)
        physics_apply_impulse(x,y, random_range(0.0005, 0.001)*cos(degtorad(other.i))*sqrt(global.timeDiff), random_range(0.0005, 0.001)*sin(degtorad(other.i))*sqrt(global.timeDiff))
        }
    }
    
repeat((irandom(2) == 0) + 2*super)
    with instance_create(x, y, Chicken)
        {
        thrower = other.thrower
        fix = physics_fixture_create()
        
        physics_fixture_set_circle_shape(fix, 7)
        physics_fixture_set_density(fix, density)
        physics_fixture_set_restitution(fix, bounce)
        physics_fixture_set_friction(fix, rubberFriction)
        
        myFix = physics_fixture_bind(fix, id)
        physics_fixture_delete(fix)
        
        thrown = true
        
        with instance_create(x,y,ChickenWing)
            {
            depth = other.depth + 1
            physics_joint_revolute_create(id, other, x, y, 0, 0, false, 0, 0, false, false)
            }
            
        with instance_create(x,y,ChickenWing)
            {
            depth = other.depth -1
            physics_joint_revolute_create(id, other, x, y, 0, 0, false, 0, 0, false, false)
            }
        }
        
audio_play_sound(SplatSound, 1, false)
    
instance_destroy()


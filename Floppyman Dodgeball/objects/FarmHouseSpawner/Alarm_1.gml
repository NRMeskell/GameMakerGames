/// @description Release Chickens

image_index = 1

chickenCount = irandom(3)+1

for(i=0; i<chickenCount; i++)
    {
    with instance_create(x+418, y+310, Chicken)
        {
        thrower = noone
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
    }
    
alarm[1] = room_speed * irandom_range(30,90)/global.timeDiff
alarm[2] = room_speed * 3/global.timeDiff


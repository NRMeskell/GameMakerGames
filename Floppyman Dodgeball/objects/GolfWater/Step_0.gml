/// @description make wet

for(i=0; i<instance_number(CharacterCollider); i++){
    currentCheck = instance_find(CharacterCollider, i)
    if place_meeting(x,y,currentCheck){
        with currentCheck{
            if global.golfMapType == "country"{ //get wet (water)
                with myCharacter{
                    golfWet = true
                    alarm[4] = room_speed * 1/global.timeDiff
                    }
                }
            else{
                alarm[0] = room_speed*3
                with myCharacter{
                    golfWet = true
                    burned = true
                    alarm[4] = room_speed * 1/global.timeDiff
                    }
                }
            }
        }
    }
    
if global.golfMapType = "lava"
    if irandom(room_speed*0.6) == 0{
        randX = irandom(sprite_width)
        if !collision_circle(x + randX,y+5, 5, Ground, true, true)
            instance_create(x + randX,y+5,LavaDrop)
    }


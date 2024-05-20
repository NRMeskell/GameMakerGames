/// @description Make Flag

flagFlag = instance_create(x + sprite_get_width(GolfFlagSpr) - 2, y-sprite_get_height(GolfFlagPoleSpr) + 5, GolfFlagFlag)
flagPole = instance_create(x,y,GolfFlag)    
    
physics_joint_revolute_create(flagFlag, other.flagPole, flagFlag.x-sprite_get_width(GolfFlagSpr)+2, flagFlag.y, 0, 0, false, 0,0,0,false)
    
    


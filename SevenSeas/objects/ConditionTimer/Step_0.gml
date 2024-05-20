/// @description Do Time

if global.doTime and !global.inPort
    {
    timer -= 1
    }
    
if timer <= 0
    {
    script_execute(condition, myArgument)
    }


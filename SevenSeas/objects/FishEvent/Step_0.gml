/// @description Turn Around

if direction > 90 and direction < 270
    image_xscale = -1
else
    image_xscale = 1
    
if y + 10 < GetWaterLevel(Ship.middleWaves, x){
 path_end()
 direction = flyAwayDir
 speed = 1
}
	
if floatAway
    {
    path_end()
    direction = flyAwayDir
    speed = max(1, global.doTime*global.gameRate)
    }


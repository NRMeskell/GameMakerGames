/// @description Turn Around

if direction > 90 and direction < 270
    image_xscale = -1
else
    image_xscale = 1
    
if !floatAway{
    image_alpha = abs(sin((current_time+alphaShift)/10000))*global.gameRate
}
else{
	image_alpha -= 0.01
}
 

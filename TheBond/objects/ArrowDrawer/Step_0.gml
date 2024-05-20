/// @description Check has moved

time += 0.05

if !instance_exists(RainbowSpirit)
    {
    if WhiteSpirit.x != whitePosX or WhiteSpirit.y != whitePosY
        whiteHasMoved = true
        
    if BlackSpirit.x != blackPosX or BlackSpirit.y != blackPosY
        blackHasMoved = true
    }
    

if !whiteHasMoved
    whiteDrawAlpha = startDrawAlpha + sin(time)*0.1
else
    whiteDrawAlpha -= 0.05
    
if !blackHasMoved   
    blackDrawAlpha = startDrawAlpha + sin(time)*0.1 
else
    blackDrawAlpha -= 0.05


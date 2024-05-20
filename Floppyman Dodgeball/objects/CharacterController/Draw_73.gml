/// @description draw golf arrows

if golfHitting{
    if !myMarker.inSand
        myArrowSprite = ArrowSpr
    else
        myArrowSprite = SandArrowSpr 
        
    draw_sprite_ext(myArrowSprite, 1 + golfSwinging*(1+(sprite_get_number(myArrowSprite)-2)*swingForce), myMarker.x, myMarker.y, 1, 1, -90 + ((90+(throwAngle)) + 2*-(90+throwAngle)), CharacterCreator.characterColors[playerNumber], 0.8)    
    }


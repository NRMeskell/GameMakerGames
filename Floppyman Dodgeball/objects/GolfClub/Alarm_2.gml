/// @description Hit Ball

myBall = instance_create(x, y+sprite_get_height(GolfClubSpr)-5, GolfBallGhost)
with myBall{
    myCharacter = other.myCharacter
    myColor = CharacterCreator.characterColors[myCharacter.playerNumber]
    xForce = -(other.hitForce)*cos(degtorad(other.throwAngle))/(myCharacter.wet+1)*sqrt(global.timeDiff)/(1+1*other.inSand)
    yForce = -(other.hitForce)*sin(degtorad(other.throwAngle))/(myCharacter.wet+1)*sqrt(global.timeDiff)/(1+1*other.inSand)
    physics_apply_impulse(x, y, xForce, yForce)
	physics_apply_angular_impulse(xForce/100)
    }




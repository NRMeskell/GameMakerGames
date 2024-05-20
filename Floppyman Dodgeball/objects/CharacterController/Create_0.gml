/// @description Forces

onGround = false
standing = false
standingForce = 0
standingRotation = 1
standingAngle = 20

walkingForce = 0.8
runningSpeed = 4
standingLimbs = 0

phySpeedPrev = 0

///Not grabbed

grabbed = false

///controls

throwButton = ord("S")
upButton = ord("W")
leftButton = ord("A")
rightButton = ord("D")

facingRight = true
stickCentered = true

spawnRange = 200
jumpShort = false


///Ball variables

sticky = false
wet = false
golfWet = false
burned = false
stunned = false
slipped = false
balloonForce = 1.5

golfHitting = false
golfSwinging = false
golfStrike = false
startSwingTime = 0
swingForce = 0
golfCharging = false
myClub = undefined


throwing = false
throwHand = 0
pickHand = 0

handBall[0] = -1
handBall[1] = -1
handSuper[0] = false
handSuper[1] = false

throwAngle = 0
grabDistance = 40
creationDistance = 30
grabSpeed = 5

ballThrowType[0] = DodgeBall
ballThrowType[1] = Bomb
ballThrowType[2] = SuperBall
ballThrowType[3] = EggBall
ballThrowType[4] = StickyBall
ballThrowType[5] = RocketBall
ballThrowType[6] = WaterBalloonBall
ballThrowType[7] = SoccerBall
ballThrowType[8] = BowlingBall
ballThrowType[9] = FootBall
ballThrowType[10] = Balloon

///Score Count

playerNumber = 0
canSpawn = true
inHole = false
startTime = current_time

hitBy = noone




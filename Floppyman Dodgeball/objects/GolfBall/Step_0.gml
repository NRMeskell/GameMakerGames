/// @description ball stuff

if phy_speed < 0.01 or place_meeting(x,y,CharacterCollider)//and !place_meeting(x,y+1, TreeParent) and !place_meeting(x,y+1,GolfTurbine)
    ballTimer += global.timeDiff
else
    ballTimer = 0
    
if ballTimer > room_speed
    event_user(1)
    
if y > room_height + 100
    event_user(0)
    
if place_meeting(x, y, GolfWater) or place_meeting(x,y,LavaDrop){
    speedChange = phy_speed
	myBounceSnd = SplashSound
    event_user(2)
    event_user(0)
}
    
if place_meeting(x,y+2,GolfSand0) or place_meeting(x,y+2,GolfSand1){
    myBounceSnd = SandBounceSound
	speedChange = phy_speed
	event_user(2)
	event_user(1)
    phy_speed_x = 0
    phy_speed_y = 0
    }

///Trail

if irandom(20)
    with instance_create(x,y,ContactParticle){
        image_blend = other.myColor
        phy_speed_x = -other.phy_speed_x/4
        phy_speed_y = -other.phy_speed_y/4
    }
if image_index == 4 and irandom(10)
    with instance_create(x,y,ContactParticle){
        image_blend = choose(c_red, c_yellow, c_orange)
        phy_speed_x = -other.phy_speed_x/4
        phy_speed_y = -other.phy_speed_y/4
    }

///Track Speed

lastSpeedX = currentSpeedX
currentSpeedX = phy_speed_x
lastSpeedY = currentSpeedY
currentSpeedY = phy_speed_y

speedChange = sqrt(sqr(lastSpeedX-currentSpeedX) + sqr(lastSpeedY-currentSpeedY))


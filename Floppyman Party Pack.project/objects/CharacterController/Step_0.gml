/// @description Bring together Body Parts

headAttachX = body.x + dsin(body.phy_rotation)*12
headAttachY = body.y - dcos(body.phy_rotation)*12

arm1AttachX = body.x - dcos(body.phy_rotation)*8
arm1AttachY = body.y - dsin(body.phy_rotation)*8

arm2AttachX = body.x + dcos(body.phy_rotation)*8
arm2AttachY = body.y + dsin(body.phy_rotation)*8

legAttachX = body.x - dsin(body.phy_rotation)*12
legAttachY = body.y + dcos(body.phy_rotation)*12

if point_distance(head.x, head.y, headAttachX, headAttachY) > 10
    {
    head.phy_position_x = body.phy_position_x
    head.phy_position_y = body.phy_position_y
    }
    
if point_distance(arm1.x, arm1.y, arm1AttachX, arm1AttachY) > 15
    {
    arm1.phy_position_x = body.phy_position_x
    arm1.phy_position_y = body.phy_position_y
    }
    
if point_distance(arm1.x, arm1.y, hand1.x, hand1.y) > 20
    {
    hand1.phy_position_x = arm1.phy_position_x
    hand1.phy_position_y = arm1.phy_position_y
    }
    
if point_distance(arm2.x, arm2.y, arm2AttachX, arm2AttachY) > 15
    {
    arm2.phy_position_x = body.phy_position_x
    arm2.phy_position_y = body.phy_position_y
    }
    
if point_distance(arm2.x, arm2.y, hand2.x, hand2.y) > 20
    {
    hand2.phy_position_x = arm2.phy_position_x
    hand2.phy_position_y = arm2.phy_position_y
    }
    
if point_distance(leg1.x, leg1.y, legAttachX, legAttachY) > 15
    {
    leg1.phy_position_x = body.phy_position_x
    leg1.phy_position_y = body.phy_position_y
    }
    
if point_distance(leg1.x, leg1.y, foot1.x, foot1.y) > 20
    {
    foot1.phy_position_x = leg1.phy_position_x
    foot1.phy_position_y = leg1.phy_position_y
    }
    
if point_distance(leg2.x, leg2.y, legAttachX, legAttachY) > 15
    {
    leg2.phy_position_x = body.phy_position_x
    leg2.phy_position_y = body.phy_position_y
    }
    
if point_distance(foot2.x, foot2.y, leg2.x, leg2.y) > 20
    {
    foot2.phy_position_x = leg2.phy_position_x
    foot2.phy_position_y = leg2.phy_position_y
    }


///Check FurthestLimbs

smallx = body.x
largex = body.x

for(i=0; i<array_length_1d(bodyPart); i++)
    with bodyPart[i]
        {
        if x < other.smallx
            other.smallx = x
        if x > other.largex
            other.largex = x
        }

///Jump and run

if !CharacterCreator.gameOver
    {
    if inputController
        {
        jumpPressed = gamepad_button_check_pressed(controllerInputNum, upButton)
        jumpHeld = gamepad_button_check(controllerInputNum, upButton)
		jumpReleased = gamepad_button_check_released(controllerInputNum, upButton)
        throwPressed = gamepad_button_check_pressed(controllerInputNum, throwButton)
        throwReleased = gamepad_button_check_released(controllerInputNum, throwButton)
        
        if joystick
            {
            leftHeld = gamepad_axis_value(controllerInputNum, gp_axislh) < -0.5
            rightHeld = gamepad_axis_value(controllerInputNum, gp_axislh) > 0.5
            }
        else
            {
            leftHeld = gamepad_button_check(controllerInputNum, leftButton)
            rightHeld = gamepad_button_check(controllerInputNum, rightButton)
            }
        }
    else
        {
        jumpPressed = keyboard_check_pressed(upButton)
		jumpHeld = keyboard_check(upButton)
        jumpReleased = keyboard_check_released(upButton)
        leftPressed = keyboard_check_pressed(leftButton)
        leftReleased = keyboard_check_released(leftButton)
        leftHeld = keyboard_check(leftButton)
        rightPressed = keyboard_check_pressed(rightButton)
        rightReleased = keyboard_check_released(rightButton)
        rightHeld = keyboard_check(rightButton)
        throwPressed = keyboard_check_pressed(throwButton)
        throwReleased = keyboard_check_released(throwButton)
        }
    }
	
holdLength = room_speed/4/global.timeDiff

if alarm[1] > 0 and jumpHeld
    {		
    with body{
        physics_apply_impulse(x,y,0,-0.06*(other.alarm[1]/other.holdLength)/(myCharacter.wet+1)*sqrt(global.timeDiff))
        }
    }	
	
if jumpPressed and !stunned and !slipped and !golfHitting and (standing) and alarm[1] < 1
    {
    alarm[1] = holdLength
    with arm1
        physics_apply_angular_impulse(0.003*sqrt(global.timeDiff))
    with arm2
        physics_apply_angular_impulse(-0.003*sqrt(global.timeDiff))
            
    with leg1
        physics_apply_angular_impulse(-0.01*sqrt(global.timeDiff))
    with leg2
        physics_apply_angular_impulse(0.01*sqrt(global.timeDiff))
		
	with body
		physics_apply_impulse(x,y,0,-1/(myCharacter.wet+1)*sqrt(global.timeDiff))
		
	}
    
if leftHeld and !stunned and !slipped and !golfHitting
    {
    facingRight = false
    
    if body.phy_speed < runningSpeed
        {
        with foot1
            {
            if other.onGround
                {
                if physics_test_overlap(x,y+2,0,Ground)
                    {
                    with other.leg1
                        {
                        //physics_apply_impulse(x,y,-0.05,0)
                        physics_apply_angular_impulse(0.02/(myCharacter.wet+1)*sqrt(global.timeDiff))
                        }
                        
                    with other.leg2
                        physics_apply_angular_impulse(-0.01/(myCharacter.wet+1)*sqrt(global.timeDiff))
                    with other.foot2
                        physics_apply_angular_impulse(0.002/(myCharacter.wet+1)*sqrt(global.timeDiff))
                        
                    physics_apply_impulse(x,y,0,-0.01/(myCharacter.wet+1)*sqrt(global.timeDiff))
                    physics_apply_angular_impulse(-0.01/(myCharacter.wet+1)*sqrt(global.timeDiff))
                    }
                    
                with other.body
                    physics_apply_force(x,y,-2/(myCharacter.wet+1)*sqr(global.timeDiff), -1*(global.timeDiff))
                }
            else
                {
                with other.body
                    physics_apply_force(x,y,-1.3/(myCharacter.wet+1)*sqr(global.timeDiff), 0)
                }
            }
        }
    }
    
if rightHeld and !stunned and !slipped and !golfHitting
    {
    facingRight = true
    if body.phy_speed < runningSpeed
        {
        with foot2
            {
            if other.onGround
                {
                if physics_test_overlap(x,y+3,0,Ground)
                    {
                    with other.leg2
                        {
                        //physics_apply_impulse(x,y,0.05,0)
                        physics_apply_angular_impulse(-0.02/(myCharacter.wet+1)*sqrt(global.timeDiff))
                        }
                    with other.leg1
                        physics_apply_angular_impulse(0.01/(myCharacter.wet+1)*sqrt(global.timeDiff))
                    with other.foot1
                        physics_apply_angular_impulse(-0.002/(myCharacter.wet+1)*sqrt(global.timeDiff))
                        
                    physics_apply_impulse(x,y,0,-0.01/(myCharacter.wet+1)*sqrt(global.timeDiff))
                    physics_apply_angular_impulse(0.01/(myCharacter.wet+1)*sqrt(global.timeDiff))
                    }
                    
                with other.body
                    physics_apply_force(x,y,2/(myCharacter.wet+1)*sqr(global.timeDiff), -1*(global.timeDiff))
                }
            else
                {
                with other.body
                    physics_apply_force(x,y,1.3/(myCharacter.wet+1)*sqr(global.timeDiff),0)
                }
            }
        }
    }

///Stand up

if !stunned and !slipped
    {
    onGround = false
    standingLimbs = 0
    
    for(i=0; i<array_length_1d(testLimb); i++)
        with testLimb[i]
            if physics_test_overlap(x, y+3, phy_rotation, Ground) or physics_test_overlap(x + 3, y + 1, phy_rotation, Ground) or physics_test_overlap(x - 3, y + 1, phy_rotation, Ground)
                {
                other.standingLimbs ++
                if other.i < 2
                    {
                    other.onGround = true
                    }
                }
       
    if standingLimbs > 1
        {         
        standing = true
        alarm[0] = room_speed/3/global.timeDiff
        }
                    
    if standing
        body.phy_rotation = 0
                
    if standing and alarm[1] < 1
        {
        with body
            {
            if phy_rotation < -180
                phy_rotation = 180
            if phy_rotation > 180
                phy_rotation = -180
            
            if phy_rotation < -other.standingAngle
                {
                physics_apply_torque(0.9*(global.timeDiff)*(abs(phy_rotation)/90*other.standingRotation*2))
                //phy_fixed_rotation = false
                }
            else if phy_rotation > other.standingAngle
                {
                physics_apply_torque(-0.9*(global.timeDiff)*(abs(phy_rotation)/90*other.standingRotation*2))
                //phy_fixed_rotation = false
                }
            else
                {
                phy_rotation = 0
                }
            }
            
        with head
            {
            if phy_rotation < -180
                phy_rotation = 180
            if phy_rotation > 180
                phy_rotation = -180
            
            if phy_rotation < -other.standingAngle
                {
                physics_apply_torque(abs(phy_rotation)/90*other.standingRotation/2*(global.timeDiff))
                }
            else if phy_rotation > other.standingAngle
                {
                physics_apply_torque(-abs(phy_rotation)/90*other.standingRotation/2*(global.timeDiff))
                }
            }
        
        if abs(body.phy_rotation) < other.standingAngle
            {
            //if !keyboard_check(leftButton)
            with leg1
                {
                if phy_rotation < -180
                    phy_rotation = 180
                if phy_rotation > 180
                    phy_rotation = -180
                
                if abs(phy_rotation) > other.standingAngle
                    {
                    physics_apply_torque(-2*(global.timeDiff)*abs(phy_rotation)/90*other.standingRotation)
                    }
                }
            //if !keyboard_check(rightButton)
            with leg2
                {
                if phy_rotation < -180
                    phy_rotation = 180
                if phy_rotation > 180
                    phy_rotation = -180
                
                if abs(phy_rotation) > other.standingAngle
                    {
                    physics_apply_torque(2*(global.timeDiff)*abs(phy_rotation)/90*other.standingRotation)
                    }
                }
            with foot1
                {
                if phy_rotation < -180
                    phy_rotation = 180
                if phy_rotation > 180
                    phy_rotation = -180
                
                if abs(phy_rotation) > other.standingAngle
                    {
                    physics_apply_torque(abs(phy_rotation)/90*other.standingRotation*(global.timeDiff))
                    }
                }
            with foot2
                {
                if phy_rotation < -180
                    phy_rotation = 180
                if phy_rotation > 180
                    phy_rotation = -180
                
                if abs(phy_rotation) > other.standingAngle
                    {
                    physics_apply_torque(-abs(phy_rotation)/90*other.standingRotation*(global.timeDiff))
                    }
                }
            }
        }
    else
        if standing = false
            body.phy_fixed_rotation = false
            
    
    if onGround and standing
        {
        body.phy_rotation = 0
        body.phy_fixed_rotation = true
        }
    }
	
if !collision_line(foot1.x, foot1.y, foot1.x, foot1.y + 20, Ground, true, true) and !collision_line(foot2.x, foot2.y, foot2.x, foot2.y + 20, Ground, true, true) and !collision_line(body.x, body.y, body.x, body.y + 60, Ground, true, true)
	standing = false
	
///Stunned
if stunned
    {
    with head
        physics_apply_force(x,y,0,1*(global.timeDiff))
    }

///Wet

if wet or golfWet{
    if irandom(5) = 0{
        limb = bodyPart[irandom(array_length_1d(bodyPart)-1)]
        
        with instance_create(limb.x+irandom(5),limb.y,ExplotionParticle){
            if !other.burned
                image_blend = choose(c_white, c_blue, c_aqua, c_blue)
            else
                image_blend = choose(c_red, c_black, c_gray, c_orange)
            }
        }
    }


///Balloon

if handBall[0] == 10
    {
    with hand1
        physics_apply_force(x, y, 0, -other.balloonForce*(global.timeDiff))
    }
if handBall[1] == 10
    {
    with hand2
        physics_apply_force(x, y, 0, -other.balloonForce*(global.timeDiff))
    }

///Throw Ball and Grab ball

if global.gameMode == "dodgeball" and !is_undefined(body){
    if !stunned and !slipped
        {
        //Pick up ball
        if instance_exists(DodgeBallParent)
            {
            grabBall = instance_nearest(body.x,body.y,DodgeBallParent)
            
            if point_distance(body.x, body.y+20, grabBall.x, grabBall.y) < grabDistance and grabBall.phy_speed < grabSpeed and grabBall.alarm[0] < 1 and grabBall.image_index != 7
                {
                if handBall[pickHand] == -1
                    {
                    handBall[pickHand] = grabBall.image_index
                    pickHand = 1-pickHand
                        
                    instance_destroy(grabBall)
                    }
                }
            }
            
        
        //throwBall
        if (handBall[throwHand] > -1) and throwPressed and throwing = false
            {
            throwAngle = -45
            throwing = true
            }
                    
        if throwing
            {
            if throwHand = 0
                {
                with arm1
                    physics_apply_torque(0.2*(global.timeDiff))
                }
            else
                {
                with arm2
                    physics_apply_torque(-0.2*(global.timeDiff))
                }
            
            throwAngle += 90/(room_speed/2)
            
            if throwAngle > 45
                throwing = false
            }
                    
        if throwReleased and throwing = true and sticky = false
            {
            throwing = false
                
            if facingRight
                {
                if phy_position_xprevious < phy_position_x
                    throwx = largex + 30 + 5*body.phy_speed_x
                else
                    throwx = largex + 30
                }
            else
                {
                if phy_position_xprevious < phy_position_x
                    throwx = smallx - 30
                else
                    throwx = smallx - 30 - 5*body.phy_speed_x
                }
            with instance_create(throwx, body.y, ballThrowType[handBall[throwHand]])
                {
                thrower = other.id
                
                thrown = true
                phy_rotation = (180*(!other.facingRight)-other.throwAngle*(-1+2*other.facingRight))*random_range(0.95, 1.05)
                if image_index != 8
                    physics_apply_impulse(x, y, (throwPower)*(-1+2*other.facingRight)*cos(degtorad(other.throwAngle))/(other.wet+1)*sqrt(global.timeDiff), -(throwPower)*sin(degtorad(other.throwAngle))/(other.wet+1)*sqrt(global.timeDiff))
                else
                    physics_apply_impulse(x, y, (throwPower)*(-1+2*other.facingRight)*cos(degtorad(other.throwAngle))/(other.wet+1)*sqrt(global.timeDiff), 0)
                if image_index = 5
                    {
                    alarm[0] = room_speed * 5/global.timeDiff
                    event_user(0)
                    }
                }
            if throwHand = 0
                with arm1
                    physics_apply_angular_impulse(-0.1*sqrt(global.timeDiff))
            else
                with arm2
                    physics_apply_angular_impulse(0.1*sqrt(global.timeDiff))
                
            handBall[throwHand] = -1
            throwHand = 1-throwHand
            }
        }
        
    //Drop balls from bowling
    else if stunned
        {
        if handBall[throwHand] > -1
            {
            if facingRight
                {
                if phy_position_xprevious < phy_position_x
                    throwx = largex + 30 + 5*body.phy_speed_x
                else
                    throwx = largex + 30
                }
            else
                {
                if phy_position_xprevious < phy_position_x
                    throwx = smallx - 30
                else
                    throwx = smallx - 30 - 5*body.phy_speed_x
                }
                
            with instance_create(throwx, body.y, ballThrowType[handBall[throwHand]])
                {
                thrower = other.id
                
                thrown = false
                }
            
            handBall[throwHand] = -1
            throwHand = 1-throwHand
            }
        }
    }


///GolfSwing

//setting up 
if golfHitting and global.gameMode == "golf"{
    body.phy_rotation = 0
    
    if !golfSwinging{
        if leftHeld{
            throwAngle -= 1
            }
        else if rightHeld {
            throwAngle += 1
            }
            
        if throwAngle > 180
            throwAngle = 180
        if throwAngle < 0
            throwAngle = 0
            
        if throwPressed and !golfSwinging{
            golfSwinging = true
			golfCharging = true
            startSwingTime = current_time
            }
            
        facingRight = throwAngle > 90
        }
      
    //Charging up swing  
    if golfSwinging
        {
        if !golfStrike
            swingForce = (1 - abs(cos((current_time - startSwingTime)/500)))
            
        if throwReleased and golfCharging{
            golfStrike = true
            myClub.alarm[0] = 0.6*room_speed/global.timeDiff
            myClub.facingRight = facingRight
            myClub.throwAngle = throwAngle
            myClub.image_xscale = 1-(2*!facingRight)
            myClub.swingForce = swingForce
			golfCharging = false
            }
        }
    }

///Track Score

if CharacterCreator.gamemode = CharacterCreator.gamemodes[4] and global.gameMode == "golf"{
    if !inHole
        ds_list_replace(CharacterCreator.scores, playerNumber, (current_time - startTime)/10000 div 1)
    }



///Recover

if canSpawn
if body.phy_position_y > room_height + 120 or body.phy_position_x < -500 or body.phy_position_x > room_width + 500  or body.phy_position_y < -2000
    {
    wet = false
	golfWet = false
    stunned = false
    //Detarget Rocket
    with body
        {
        with RocketBall
            if targetPlayer = other.id
                targetPlayer = noone
        }
    
    
    with CharacterCreator
        {
        if (global.gameMode = "dodgeball"){
            //knockout
            if (gamemode == gamemodes[0])
                {
                if !gameOver
                    ds_list_replace(scores, other.playerNumber, ds_list_find_value(scores, other.playerNumber) - 1)
                
                if ds_list_find_value(scores, other.playerNumber) == 0
                    {
                    with other
                        event_user(0)
                        
                    if instance_number(CharacterController) == 1
                        event_user(0)
                    }
                }
                
            //countdown and point play
            if (gamemode != gamemodes[0])
                {
                if other.hitBy and other.hitBy != other.id and !gameOver
                    {
                    ds_list_replace(scores, other.hitBy.playerNumber, ds_list_find_value(scores, other.hitBy.playerNumber) + 1)
                
                    if ds_list_find_value(scores, other.hitBy.playerNumber) == startingScore and gamemode == gamemodes[1]
                        {
                        winner = other.hitBy.playerNumber
                        event_user(0)
                        }    
                    }
                
                other.hitBy = noone
                }
            }
        }
        
    if canSpawn and global.gameMode == "dodgeball"
        {
        spawnX = irandom_range(spawnRange, room_width-spawnRange)
        global.loopBreaker = 0
        goodSpawn = true
        for(i=-50; i<51; i++)
            if (!collision_line(spawnX + i, 0, spawnX + i, room_height, Ground, true, true))
                goodSpawn = false
                
        while !goodSpawn and global.loopBreaker < 100
            {
            global.loopBreaker++
            spawnX = irandom_range(spawnRange, room_width-spawnRange)
            
            goodSpawn = true
            for(i=-50; i<51; i++)
                if (!collision_line(spawnX + i, 0, spawnX + i, room_height, Ground, true, true))
                    goodSpawn = false
            }
            
        for(i=0; i<array_length_1d(bodyPart); i++)
            with bodyPart[i]
                {
                phy_position_y = -64
                phy_position_x = other.spawnX
                phy_speed_x = 0
                phy_speed_y = 0
                }
        
        handBall[0] = -1
        handBall[1] = -1
        throwHand = 0
        pickHand = 0
        sticky = false
        throwing = false
        }
    else if global.gameMode == "golf" {
        for(i=0; i<array_length_1d(bodyPart); i++)
             with bodyPart[i]
                 {
                 phy_position_y = TeeBox.y - 64
                 phy_position_x = TeeBox.x
                 phy_speed_x = 0
                 phy_speed_y = 0
                 }
         
         handBall[0] = -1
         handBall[1] = -1
         throwHand = 0
         pickHand = 0
         sticky = false
         throwing = false
         wet = false
		 golfWet = false
         stunned = false
        }
    }


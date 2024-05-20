/// @description Create Character

for(i=0; i<ds_list_size(joyStickList); i++)
    {
    with instance_create(room_width/2,0,CharacterController)
        {    
        playerNumber = other.i
        
        body = instance_create(room_width/2,0,CharacterBody)
        head = instance_create(body.x,body.y-sprite_get_height(BodySpr)/2-5, CharacterHead)
        leg1 = instance_create(body.x-sprite_get_width(LegSpr)/2, body.y+sprite_get_height(BodySpr)/2+sprite_get_height(LegSpr)/2, CharacterLeg)
        leg2 = instance_create(body.x+sprite_get_width(LegSpr)/2, body.y+sprite_get_height(BodySpr)/2+sprite_get_height(LegSpr)/2, CharacterLeg)
        foot1 = instance_create(body.x-sprite_get_width(LegSpr)/2, body.y+sprite_get_height(BodySpr)/2+sprite_get_height(LegSpr)+sprite_get_height(FootSpr)/2, CharacterFoot)
        foot2 = instance_create(body.x+sprite_get_width(LegSpr)/2, body.y+sprite_get_height(BodySpr)/2+sprite_get_height(LegSpr)+sprite_get_height(FootSpr)/2, CharacterFoot)
        arm1 = instance_create(body.x-sprite_get_width(BodySpr)/2-sprite_get_width(ArmSpr)/2, body.y - sprite_get_height(BodySpr)/3, CharacterArm)
        arm2 = instance_create(body.x+sprite_get_width(BodySpr)/2+sprite_get_width(ArmSpr)/2, body.y - sprite_get_height(BodySpr)/3, CharacterArm)
        hand1 = instance_create(body.x-sprite_get_width(BodySpr)/2-sprite_get_width(ArmSpr)-sprite_get_width(HandSpr)/2, body.y - sprite_get_height(BodySpr)/3, CharacterHand)
        hand2 = instance_create(body.x+sprite_get_width(BodySpr)/2+sprite_get_width(ArmSpr)+sprite_get_width(HandSpr)/2, body.y - sprite_get_height(BodySpr)/3, CharacterHand)
        
        hand1.phy_rotation = 180;
        arm1.phy_rotation = 180;
        physics_joint_revolute_create(body, head, head.x, head.y + 7, -15, 15, 1, 0, 0, 0, true)
        physics_joint_revolute_create(body, arm1, body.x - sprite_get_width(BodySpr)/2, body.y - sprite_get_height(BodySpr)/3, -80, 60, 1, 0, 0, 0, true)
        physics_joint_revolute_create(body, arm2, body.x + sprite_get_width(BodySpr)/2, body.y - sprite_get_height(BodySpr)/3, -60, 80, 1, 0, 0, 0, true)
        physics_joint_revolute_create(arm1, hand1, arm1.x - sprite_get_width(ArmSpr)/2, arm1.y, -80, 50, 1, 0, 0, 0, true)
        physics_joint_revolute_create(arm2, hand2, arm2.x + sprite_get_width(ArmSpr)/2, arm1.y, -50, 80, 1, 0, 0, 0, true)
        
        physics_joint_revolute_create(body, leg1, body.x-sprite_get_width(LegSpr)/2, body.y+sprite_get_height(BodySpr)/2, 5, 75, 1, 0, 0, 0, true)
        physics_joint_revolute_create(body, leg2, body.x+sprite_get_width(LegSpr)/2, body.y+sprite_get_height(BodySpr)/2, -75, -5, 1, 0, 0, 0, true)
        
        physics_joint_revolute_create(leg1, foot1, leg1.x, leg1.y+sprite_get_height(LegSpr)/2, -100, 0, 1, 0, 0, 0, true)
        physics_joint_revolute_create(leg2, foot2, leg2.x, leg2.y+sprite_get_height(LegSpr)/2, 0, 100, 1, 0, 0, 0, true)
        
        testLimb[0] = foot1
        testLimb[1] = foot2
        testLimb[2] = hand2
        testLimb[3] = hand1
        testLimb[4] = leg1
        testLimb[5] = leg2
        
        bodyPart[0] = body
        bodyPart[1] = head
        bodyPart[2] = arm1
        bodyPart[3] = arm2
        bodyPart[4] = hand1
        bodyPart[5] = hand2
        bodyPart[6] = leg1
        bodyPart[7] = leg2
        bodyPart[8] = foot1
        bodyPart[9] = foot2
        
        throwButton = ds_list_find_value(other.throwButtonList, other.i)
        upButton = ds_list_find_value(other.upButtonList, other.i)
        leftButton = ds_list_find_value(other.leftButtonList, other.i)
        rightButton = ds_list_find_value(other.rightButtonList, other.i)
        inputController = ds_list_find_value(other.inputControllerList, other.i)
        controllerInputNum = ds_list_find_value(other.controllerInputNumList, other.i)
        joystick = ds_list_find_value(other.joyStickList, other.i)
        
        myHeadType = ds_list_find_value(other.headList, other.i)
        myShirtType = ds_list_find_value(other.shirtList, other.i)
        myPantsType = ds_list_find_value(other.pantsList, other.i)
        mySkinColor = ds_list_find_value(other.skinList, other.i)
		
        with body
            physics_apply_angular_impulse(random_range(-0.5,0.5)*(global.timeDiff))
        
        for(i=0; i<array_length_1d(bodyPart); i++)
            bodyPart[i].myCharacter = id
            
        facingRight = true
        
        //random spawn for GOLF
        if global.gameMode == "dodgeball"{
            spawnX = irandom_range(spawnRange, room_width-spawnRange)
            global.loopBreaker = 0
            while (!collision_line(spawnX, 0, spawnX, room_height, Ground, true, true) and !collision_line(spawnX, 0, spawnX - 20, room_height, Ground, true, true) and !collision_line(spawnX, 0, spawnX + 20, room_height, Ground, true, true)) and global.loopBreaker < 100
                {
                global.loopBreaker++
                spawnX = irandom_range(spawnRange, room_width-spawnRange)
                }
                
            for(i=0; i<array_length_1d(bodyPart); i++)
                with bodyPart[i]
                    {
                    phy_position_y = -64
                    phy_position_x = other.spawnX
                    phy_speed_x = 0
                    phy_speed_y = 0
                    }
            }
        else if global.gameMode == "golf"{
            with Ground {
                with instance_create(x,y,object_index)
					image_xscale = other.image_xscale
					
                instance_destroy()
                }
                
            myMarker = instance_create(TeeBox.x, TeeBox.y, BallMarker)
            myMarker.image_blend = CharacterCreator.characterColors[playerNumber]
            myMarker.myCharacter = id
			myMarker.myHead = myHeadType
                
			with GrassOutliner
				drawOutline = true
			
            for(i=0; i<array_length_1d(bodyPart); i++)
                with bodyPart[i]
                    {
                    phy_position_y = TeeBox.y - 64
                    phy_position_x = TeeBox.x
                    phy_speed_x = 0
                    phy_speed_y = 0
                    }
            }
        }
    }



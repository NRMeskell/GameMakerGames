/// @description Update Enemy Actions

event_user(6)

///Run Player Turn

overEndTurnButton = point_in_rectangle(mouse_x, mouse_y, startX - sprite_get_width(EndTurnSpr)/2, startY - yGap - sprite_get_height(EndTurnSpr)/2, startX + sprite_get_width(EndTurnSpr)/3, startY - yGap + sprite_get_height(EndTurnSpr)/2)

if playerTurn and !instance_exists(Event)
    {
    if mouse_check_button_pressed(mb_left) and (overEndTurnButton and (canEndTurn or showSkipButton))
        {
        pirateMoved = true
        
        with ActionParent
            {
            if waitLeft > 0
                waitLeft -= 1
            if selected == true
                {
                event_user(1)
                waitLeft = rechargeTime
                if myPirate != noone
                    {
                    if myPirate.myPet.itemPower == "recharge"
                        waitLeft -= 1
                    }
                    
                other.pirateMoved = false
                if myType == "cannon"
                    LoseCargo(2,1)
                }
            }
        playerTurn = false
        if pirateMoved or (!canEndTurn)
            event_user(0)
        }
        
    }

///Die

if (myHealth < 1 or instance_number(Enemy) < 1) and alarm[1] == -1
    {
    if myHealth < 1
        myHealth = 0
    alarm[1] = room_speed*3
    with Enemy
        visible = false
    }

if alarm[1] != -1
    {
    sinkY += 200/(room_speed*5)
    sinkRotate += 30/(room_speed*5)
    }

///Health Update

if abs(healthDiff - myHealth) > 1
    {
    if !updateHealthDiff
        healthDiffTimer ++
        
    if healthDiffTimer > room_speed*Pirate.healthTimer
        updateHealthDiff = true
        
    if updateHealthDiff
        healthDiff += sign(myHealth - healthDiff)
    }
else
    {
    healthDiff = myHealth
    updateHealthDiff = false
    healthDiffTimer = 0
    }

///View Test

//normal view
if playerTurn and !instance_exists(RealAttack) or (myHealth = 0 or instance_number(Enemy) = 0) or alarm[2] != -1
    combatView = false
else // combat view
    combatView = true
    

combatZoomSpeed = 0.01
combatXShift = 3.5
combatYShift = 1
if combatView
    {
    //zoom
    if __view_get( e__VW.WView, 0 ) > room_width * 0.9
        {
        __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) * (1 - combatZoomSpeed) )
        __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) * (1 - combatZoomSpeed) )
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (combatXShift) )
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (combatYShift) )
        }
    }
else
    {
    if __view_get( e__VW.WView, 0 ) < room_width
        {
        __view_set( e__VW.WView, 0, __view_get( e__VW.WView, 0 ) / (1 - combatZoomSpeed) )
        __view_set( e__VW.HView, 0, __view_get( e__VW.HView, 0 ) / (1 - combatZoomSpeed) )
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (combatXShift) )
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (combatYShift) )
        }
    }


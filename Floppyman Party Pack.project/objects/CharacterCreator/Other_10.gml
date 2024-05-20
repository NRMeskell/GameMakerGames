/// @description GameOver

if global.gameMode == "dodgeball"{
    if gamemode = gamemodes[0]
        {
        for(i=0; i<ds_list_size(scores); i++)
            {
            if ds_list_find_value(scores, i) != 0
                winner = i
            }
        }
    
    with CharacterController
        {
		jumpHeld = irandom(1)
        jumpReleased = false
        throwPressed = false
        throwReleased = false
		leftHeld = false
		rightHeld = false
		if standing{
			jumpPressed = true
			with body
				physics_apply_torque(random_range(-2, 2))
			}
        }
    }
    
if global.gameMode == "golf"{
    for(i=0; i<ds_list_size(totalScores); i++){
        ds_list_replace(totalScores, i, ds_list_find_value(totalScores, i) + ds_list_find_value(scores, i))
    }

    //find current winner
    winningScore = ds_list_find_value(totalScores, 0)
    winner = 0
    
    for(i=1; i<ds_list_size(totalScores); i++)
        {
        if ds_list_find_value(totalScores, i) < winningScore
            {
            winner = i
            winningScore = ds_list_find_value(totalScores, i)
            }
        else if ds_list_find_value(totalScores, i) == winningScore
            winner = -1
        }

    }
    
alarm[1] = room_speed * 3/global.timeDiff * 3*instance_exists(LastHole)
gameOver = true


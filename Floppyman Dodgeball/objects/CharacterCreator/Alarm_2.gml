/// @description Countdown mode timer

//dodgeball
if !instance_exists(GolfBall) and !instance_exists(GolfBallGhost){
    if global.gameMode = "dodgeball"{
        winningScore = 0
        
        for(i=0; i<ds_list_size(scores); i++)
            {
            if ds_list_find_value(scores, i) > winningScore
                {
                winner = i
                winningScore = ds_list_find_value(scores, i)
                }
            else if ds_list_find_value(scores, i) == winningScore
                winner = -1
            }
        }
    else if global.gameMode == "golf" and gameOver == false{
        with CharacterController{
            if CharacterCreator.gamemode = CharacterCreator.gamemodes[3]{
                ds_list_replace(CharacterCreator.scores, playerNumber, ds_list_find_value(CharacterCreator.scores, playerNumber)+5)
            }
            if CharacterCreator.gamemode = CharacterCreator.gamemodes[3]{
                ds_list_replace(CharacterCreator.scores, playerNumber, ds_list_size(CharacterCreator.scores) + 1)
            }
            instance_destroy(GolfBall)
            instance_destroy(GolfBallGhost)
            instance_destroy(myClub)
            event_user(0)
        }
    }
    
    event_user(0)
    }
else{
    alarm[2] ++
    }


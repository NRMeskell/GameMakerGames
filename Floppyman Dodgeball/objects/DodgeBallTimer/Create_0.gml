/// @description Start Timer

dropRate = 1

dropRates[0] = 2
dropRates[1] = 2
dropRates[2] = 1
dropRates[3] = 0.75
dropRates[4] = 0.5

ballType = DodgeBall

dodgeballTimer = 2

playerAdjustment = power(0.9, ds_list_size(CharacterCreator.inputControllerList))
alarm[0] = (room_speed*random_range(1, 2)*dodgeballTimer*dropRate/global.timeDiff)*playerAdjustment

///Create Buttons

ballList = ds_list_create()
ds_list_add(ballList, DodgeBall, Bomb, EggBall, SuperBall, RocketBall, WaterBalloonBall, FootBall, Balloon, SoccerBall, BowlingBall)

buttonX = 200
buttonY = 420
buttonXGap = sprite_get_width(BallButtonSpr) + 20
buttonYGap = 45

instance_create(buttonX + buttonXGap, buttonY - buttonYGap, BallAmountButton)

ballMap = ds_map_create()
ds_map_add(ballMap, DodgeBall, 0)
ds_map_add(ballMap, Bomb, 1)
ds_map_add(ballMap, SuperBall, 2)
ds_map_add(ballMap, EggBall, 3)
ds_map_add(ballMap, RocketBall, 5)
ds_map_add(ballMap, WaterBalloonBall, 6)
ds_map_add(ballMap, SoccerBall, 7)
ds_map_add(ballMap, BowlingBall, 8)
ds_map_add(ballMap, FootBall, 9)
ds_map_add(ballMap, Balloon, 10)

for(i=0; i<ds_list_size(ballList); i++)
    {
    with instance_create(buttonX + (i % 5)*buttonXGap, buttonY + buttonYGap*(i div 5), BallButton)
        {
        ball = ds_list_find_value(other.ballList, other.i)
        sprite = ds_map_find_value(other.ballMap, ball)
        }
    }


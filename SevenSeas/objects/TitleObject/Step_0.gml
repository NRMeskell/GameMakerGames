/// @description Fall

if dropSpeed != 0{
    dropSpeed += myGrav
    y += dropSpeed
    }

if y > dropY{
    if dropSpeed < 0.05{
        y = dropY
        dropSpeed = 0
        }
    else
        {
        y = dropY
        dropSpeed = -dropSpeed/4
        }
    }



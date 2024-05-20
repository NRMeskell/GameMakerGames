/// @description update state for treasure

result = irandom(6)

if result <= myVar + searchReputationType("nature")[0] and myVar != 0{
    myState = min(result + 1, 4) //get treasure
    myVar -= max(result, 0) //reset score
    }
else
    myState = 1


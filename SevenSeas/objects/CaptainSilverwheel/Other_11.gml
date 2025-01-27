/// @description Update State based on var

if myVar < 3
	myState = "unmet"
else if myVar < 4
	myState = "trade"
else if myVar < 6
	myState = "repay"
else 
	myState = "demand"
/// @description Update State based on var

if myVar < 4
	myState = "unmet"
else if myVar < 5
	myState = "trade"
else if myVar < 7
	myState = "repay"
else 
	myState = "demand"
/// @description Update State based on var

if myVar < 2
	myState = "unmet"
else if myVar < 4
	myState = "trade"
else if myVar < 5
	myState = "repay"
else 
	myState = "demand"
/// @description Search for treasure

instance_destroy(LandFlavor)

if myPortType = 0{
	mySpecialAction = LookInCave
	myAnimationTimes = [room_speed/2, room_speed]
	myAnimation = [[510, 530], [160, 170], Bat]
}
else if myPortType = 2{
    mySpecialAction = ClimbCliff
	myAnimationTimes = [170, room_speed]
	myAnimation = [[364, 364], [83, 83], RopeHook]
	}
else if myPortType = 3{
    mySpecialAction = DigForTreasure
	myAnimationTimes = [room_speed*7, room_speed*7]
	myAnimation = [[430, 430], [275, 275], TreasureChest]
}
else if myPortType = 4
	{
    mySpecialAction = JungleAction
	myAnimationTimes = [room_speed/2, room_speed]
	myAnimation = [[430, 430], [275, 275], JungleBird]
}
else if myPortType = 5
	{
    mySpecialAction = OasisAction
	myAnimationTimes = [room_speed, room_speed*3]
	myAnimation = [[310, 410], [250, 260], OasisSplash]
}
else if myPortType = 6
	{
    mySpecialAction = SearchWreckage
	myAnimationTimes = [room_speed*7, room_speed*7]
	myAnimation = [[Ship.drawX+1, Ship.drawX+1], [Ship.drawY, Ship.drawY], SearchBoat]
}
else if myPortType = 7
	{
    mySpecialAction = TikiHeads
	myAnimationTimes = [room_speed*7, room_speed*7]
	myAnimation = [[Ship.drawX+1, Ship.drawX+1], [Ship.drawY, Ship.drawY], TikiOffer]
}

sprite_index = CampFireDeadSpr


/// @description Search for treasure

instance_destroy(LandFlavor)
// Play basic searching sound
if global.skipCamp
	audio_play_sound(SearchingSnd, 1, false)
	
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
	myAnimation = [[260, 310], [280, 290], OasisSplash]
}
else if myPortType = 6
	{
    mySpecialAction = SearchWreckage
	myAnimationTimes = [room_speed*7, room_speed*7]
	myAnimation = [[Ship.drawX+1, Ship.drawX+1], [Ship.drawY, Ship.drawY], SearchBoat]
}
else if myPortType = 7
	{
    mySpecialAction = HuntSeaLions
	myAnimationTimes = [room_speed, room_speed/2]
	myAnimation = [[400, 500], [230, 240], SeaLion]
}
else if myPortType = 8
	{
    mySpecialAction = DesertWander
	myAnimationTimes = [room_speed/2, room_speed]
	myAnimation = [[room_width/3, room_width], [room_height/2 - 50, room_height/2+50], SandBlowing]
}
else if myPortType = 9
	{
    mySpecialAction = RaftDownRiver
	myAnimationTimes = [room_speed*7, room_speed*7]
	myAnimation = [[333+PortDrawerBack.drawPortShiftX, 333+PortDrawerBack.drawPortShiftX], [273+PortDrawerBack.drawPortShiftY, 273+PortDrawerBack.drawPortShiftY], RiverBoat]
}
else if myPortType = 10
	{
    mySpecialAction = RollBurningRocks
	myAnimationTimes = [room_speed, room_speed*2]
	myAnimation = [[room_width/2, room_width*2/3], [room_height/2 - 25, room_height/2+50], GiantFire]
}
else if myPortType = 11
	{
    mySpecialAction = TikiHeads
	myAnimationTimes = [room_speed*7, room_speed*7]
	myAnimation = [[0,0], [0,0], TikiOffer]
}

if sprite_index = CampFireSpr
	sprite_index = CampFireDyingSpr
else
	sprite_index = CampFireDeadSpr
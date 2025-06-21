/// @description Do attack

var cursedPirates = 0
damage = 0
with Pirate{
	if body == sprite_get_number(PirateManSkinSpr)-1{
		other.cursedPirates += 1
		other.damage += myHealth div 2
		UpdateHealth(id, -myHealth div 2)
	}
}

//if not all pirates are cursed
if cursedPirates < instance_number(Pirate){
	var cursePirate = RandomPirate()
	while cursePirate.body == sprite_get_number(PirateManSkinSpr)-1
		cursePirate = RandomPirate()
		
	CursePirate(cursePirate)
}



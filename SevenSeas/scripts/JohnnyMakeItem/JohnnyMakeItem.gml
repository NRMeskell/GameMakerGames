function JohnnyMakeItem() {
	ds_list_add(global.notificationList, "Johnny Shortsticks crafts!", "Johnny shortsticks used leftover scraps to make a new item!")
	global.moraleBoost = "Johnny"
	GetRandomLoot(1, "Crafted", [-1])

	JohnnyShortsticks.myState = 1



}

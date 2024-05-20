/// @description Name
function GeneratePirateName() {

	randomize()

	nameFirst = ds_list_create()
	if mySkin = PirateManSkinSpr
	    ds_list_add(nameFirst, "Blade", "Robert", "George", "Jon", "John", "Luke", "Tim", "Will", "Bill", "Billy", "Davey", "Jack", "Smith", "Sam", "James", "Harry", "Max", "Bob", "Jake", "Henry", "Nate", "Brook", "Ocean", "Chuck", "Danny", "Peter", "Dave", "Eliot")
	else
	    ds_list_add(nameFirst, "Anya", "Ella", "Sam", "Mia", "Abby", "Ash", "Cal", "Emma", "Jetta", "Jewel", "Lily", "Lila", "Maddie", "Sia", "Piper", "Sandi", "Pip", "Zoe", "Belle", "Coral", "Lucy", "Maria", "Pearl", "Skye", "Alice", "Mary", "Rose")

	nameLast1 = ds_list_create()
	ds_list_add(nameLast1, "Ugly", "Sad", "Happy", "Crusty", "Dread", "Cut", "Gray", "Dead", "Blood", "Greasy", "Black", "Steel", "Swift", "Bad", "Silver", "Boom", "Flint", "Smoke", "Red", "Big", "Long", "Quick", "Dread", "Short", "Crazy", "Storm", "Kill", "Iron", "Water", "Salty", "Gold", "Doom", "Bone", "Mad", "True", "Blue", "Broken")
	nameLast2 = ds_list_create()
	ds_list_add(nameLast2, "throat", "shot", "parrot", "hat", "rope", "hook", "nose", "sword", "fire", "boots", "teeth", "nose", "eye", "boat", "fish", "grog", "rum", "sail", "hair", "tooth", "pants", "cannon", "bones", "ear", "skull", "wind", "sea", "anchor", "shark", "sparrow", "lips")


	firstName = ds_list_find_value(nameFirst, irandom(ds_list_size(nameFirst)-1))
	lastName = ds_list_find_value(nameLast1, irandom(ds_list_size(nameLast1)-1)) + ds_list_find_value(nameLast2, irandom(ds_list_size(nameLast2)-1))

	draw_set_font(global.PirateFont)

	while string_width(string_hash_to_newline(firstName + " " + lastName)) > 149
	    {
	    firstName = ds_list_find_value(nameFirst, irandom(ds_list_size(nameFirst)-1))
	    lastName = ds_list_find_value(nameLast1, irandom(ds_list_size(nameLast1)-1)) + ds_list_find_value(nameLast2, irandom(ds_list_size(nameLast2)-1))
	    }

	name = firstName + " " + lastName



}

/// @description Looks

differentHairNumber = 3

myGender = choose(0,1)
if myGender
    {
    mySkin = PirateManSkinSpr
    myFace = PirateManFaceSpr
    }
else
    {
    mySkin = PirateWomanSkinSpr
    myFace = PirateWomanFaceSpr
    }
    
    
overClosed = false

size = 1
xPicture = 38*size
yPicture = 35*size

xWindow = room_width*1/2-sprite_get_width(PirateSheetSpr)/2*size + 15
yWindow = room_height*1/2-sprite_get_height(PirateSheetSpr)/2*size +10

brown = make_color_rgb(75,35,0)
black = make_color_rgb(30,30,30)
blonde = make_color_rgb(145,116,0)
dkBrown = make_color_rgb(55,27,0)
gray = make_color_rgb(50,50,50)
white = make_color_rgb(150,150,150)
red = make_color_rgb(181,46,0)

skinDark = random(0.8)
skinColor = merge_color(c_white, merge_color(c_black, c_red, 0.2), skinDark)

face = irandom(sprite_get_number(PirateManFaceSpr)-1)
body = irandom(sprite_get_number(PirateManSkinSpr)-1)

if mySkin = PirateManSkinSpr
    {
    beard = irandom(sprite_get_number(PirateBeardSpr)-1)
    hair = irandom(sprite_get_number(PirateHairSpr)-1 -differentHairNumber)
    }
else
    {
    beard = 0
    hair = irandom(sprite_get_number(PirateHairSpr)-1 -differentHairNumber) + differentHairNumber
    }
    
hairColor = merge_color(choose(red, black, brown, dkBrown, blonde, gray, white), merge_color(c_black, c_olive, 0.2), skinDark)

///Speech Dictionaries

//Main Dicts found in SpeechController
myPirateDict = ds_map_create()
ds_map_copy(myPirateDict, SpeechController.pirateDict0)


pirateTalkSize = irandom(ds_map_size(SpeechController.pirateDict1))
for(i=0; i<pirateTalkSize; i++)
    {
    currentKey = ds_map_find_first(SpeechController.pirateDict1)
    rand = irandom(ds_map_size(SpeechController.pirateDict1))
    for(r=0; r<rand; r++)
        currentKey = ds_map_find_next(SpeechController.pirateDict1, currentKey)
        
    if ds_map_find_value(myPirateDict, currentKey) != 0
        ds_map_add(myPirateDict, currentKey, ds_map_find_value(SpeechController.pirateDict1, currentKey))
    }


///Name

randomize()

nameFirst = ds_list_create()
if mySkin = PirateManSkinSpr
    ds_list_add(nameFirst, "Blade", "Robert", "George", "Jon", "John", "Luke", "Tim", "Will", "Bill", "Billy", "Davey", "Jack", "Smith", "Sam", "James", "Harry", "William", "Bob", "Jake", "Henry", "Nate", "Brook", "Ocean", "Chuck")
else
    ds_list_add(nameFirst, "Anya", "Ella", "Sam", "Mia", "Abby", "Ash", "Cal", "Emma", "Jetta", "Jewel", "Lily", "Lila", "Maddie", "Sia", "Piper", "Sandi", "Sandrea", "Pip", "Zoe", "Belle", "Coral", "Lucy", "Maria", "Pearl", "Skye")

nameLast1 = ds_list_create()
ds_list_add(nameLast1, "Ugly", "Sad", "Happy", "Crusty", "Dread", "Cut", "Gray", "Dead", "Blood", "Greasy", "Black", "Steel", "Swift", "Bad", "Silver", "Boom", "Flint", "Smoke", "Red", "Big", "Long", "Quick", "Dread", "Short", "Crazy", "Storm", "Kill", "Iron", "Water", "Salty", "Gold", "Doom", "Bone", "Mad", "True", "Blue", "Broken")
nameLast2 = ds_list_create()
ds_list_add(nameLast2, "throat", "shot", "parrot", "hat", "rope", "hook", "nose", "sword", "fire", "boots", "teeth", "nose", "eye", "boat", "fish", "rum", "grog", "sail", "hair", "tooth", "pants", "cannon", "bones", "ear", "skull", "wind", "sea", "anchor", "shark", "sparrow")


firstName = ds_list_find_value(nameFirst, irandom(ds_list_size(nameFirst)-1))
lastName = ds_list_find_value(nameLast1, irandom(ds_list_size(nameLast1)-1)) + ds_list_find_value(nameLast2, irandom(ds_list_size(nameLast2)-1))

draw_set_font(global.PirateFont)

while string_width(string_hash_to_newline(firstName + " " + lastName)) > 149
    {
    firstName = ds_list_find_value(nameFirst, irandom(ds_list_size(nameFirst)-1))
    lastName = ds_list_find_value(nameLast1, irandom(ds_list_size(nameLast1)-1)) + ds_list_find_value(nameLast2, irandom(ds_list_size(nameLast2)-1))
    }

name = firstName + " " + lastName


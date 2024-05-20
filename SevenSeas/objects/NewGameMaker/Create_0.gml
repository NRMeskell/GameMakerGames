/// @description Name vars

drawFirstY = 0
drawSecondY = 0
drawDistance = 22
drawSpeed = 2

currentFirst = 0
currentLast = 0

//Create Possible Names
firstNames = ds_list_create()
lastNames = ds_list_create()
ds_list_add(firstNames, "Black", "White", "Blue", "Red", "Barbaric", "Rusty", "Bloody", "Broken", "Drunken", "Cursed", "Golden", "Grand", "Jolly", "Lost", "Old", "Salty", "Sea", "Speedy", "Wild")
ds_list_add(lastNames, "Skull", "Pearl", "Ghost", "Secret", "Wind", "Serpent", "Hook", "Mermaid", "Anchor", "Dragon", "Timber", "Plank", "Night", "Squid", "Shark", "Death", "Whale", "Thief", "Revenge")

myNames = ReadAllSaveFiles()
nameSize = ds_list_size(firstNames)
for(i=0; i<nameSize; i++){
    for(j=0; j<array_length_1d(myNames); j++){
        if ds_list_find_value(firstNames, i) != undefined{
            if string_count(ds_list_find_value(firstNames, i), myNames[j]) > 0
                ds_list_delete(firstNames, i)
            }
        if ds_list_find_value(lastNames, i) != undefined{
            if string_count(ds_list_find_value(lastNames, i), myNames[j]) > 0
                ds_list_delete(lastNames, i)
            }
        }
    }
    
ds_list_shuffle(firstNames)
ds_list_shuffle(lastNames)


///Fall and button vars

dropSpeed = random_range(2,3)
myGrav = 0.2
dropY = room_height/2 + 10

overLeftUp = false
overLeftDown = false
overRightUp = false
overRightDown = false
overBack = false
overEnter = false

farVer = 50
nearVer = 25
farHor = 65
nearHor = 33

lowButtonTop = 72
lowButtonBottom = 93
lowButtonFar = 103
lowButtonNear = 13

image_index = 0
image_speed = 0


/// @description Get Load Games

myGames = ds_list_create()
files = ReadAllSaveFiles()
for(var i=0; i<array_length(files); i++){
    ds_list_insert(myGames, 0, [files[i], GetGameStats(files[i])])
}
    

buttonAlign = 110
buttonStartY = 56
buttonDistance = 50
buttonNumber = 4
buttonSplit = 178
buttonPos = 0
 


///Fall and button vars

dropSpeed = random_range(2,3)
myGrav = 0.2
dropY = room_height/2 + 10

overUp = false
overDown = false
overBack = false

for(i=0; i<ds_list_size(myGames); i++){
    overButton[i] = false
    overTrash[i] = false
    }


image_index = 0
image_speed = 0


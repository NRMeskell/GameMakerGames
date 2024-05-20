/// @description Options

with instance_create(room_width/2, 170, SaveGameFile)
    {
    image_index = 17
    image_speed = 0
    LoadFile = "savegame1"
    }
with instance_create(room_width/2, 250, SaveGameFile)
    {
    image_index = 18
    image_speed = 0
    LoadFile = "savegame2"
    }
with instance_create(room_width/2, 330, SaveGameFile)
    {
    image_index = 19
    image_speed = 0
    LoadFile = "savegame3"
    }
    
instance_create(room_width/2, 410, DoneButton)

instance_create(0,0,OptionMenu)


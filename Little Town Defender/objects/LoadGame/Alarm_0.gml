/// @description Options

with instance_create(room_width/2, 170, LoadGameFile)
    {
    image_index = 20
    image_speed = 0
    LoadFile = "savegame1"
    }
with instance_create(room_width/2, 250, LoadGameFile)
    {
    image_index = 21
    image_speed = 0
    LoadFile = "savegame2"
    }
with instance_create(room_width/2, 330, LoadGameFile)
    {
    image_index = 22
    image_speed = 0
    LoadFile = "savegame3"
    }
    
instance_create(room_width/2, 410, DoneButton)

instance_create(0,0,OptionMenu)


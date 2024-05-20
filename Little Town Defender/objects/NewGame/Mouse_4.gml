/// @description Start New Game

if !instance_exists(OptionMenu)
{
instance_create(room_width/2, 170, EasyOption)
instance_create(room_width/2, 250, MedOption)
instance_create(room_width/2, 330, HardOption)
with instance_create(room_width/2, 410, CancelButton)
    {
    image_xscale = 0.8
    image_yscale = image_xscale
    }

instance_create(0,0,OptionMenu)
}


/// @description Vars

image_speed = 0
image_index = 9

with instance_create(x - sprite_width/2 + 25 + global.MusicVolume * (sprite_width - 50), y, Slider)
    {
    Function = "Music"
    }


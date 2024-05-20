/// @description Vars

image_speed = 0
image_index = 10

with instance_create(x - sprite_width/2 + 25 + global.SoundVolume * (sprite_width - 50) * 1.5, y, Slider)
    {
    Function = "Sound"
    }


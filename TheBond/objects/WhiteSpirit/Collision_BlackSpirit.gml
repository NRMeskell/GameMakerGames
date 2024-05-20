/// @description Victory

snd = audio_play_sound(WinSnd, 1, false)
audio_sound_gain(snd, 2, 1)
snd = audio_play_sound(Win2Snd, 1, false)
audio_sound_gain(snd, 2, 1)

averageX = (x+BlackSpirit.x)/2 div 1
averageY = (y+BlackSpirit.y)/2 div 1

for(i=0; i<10; i++)
    with instance_create(averageX+irandom_range(-10,10), averageY+irandom_range(-10,10), Cloud)
        {
        image_blend = choose(c_white, c_black, c_red, c_aqua, c_lime, c_orange, c_purple, c_yellow)
        image_index = irandom(4)
        shrinkSpeed = 8
        image_speed = 0
        image_angle = choose(0,90,180,270)
        move_towards_point(other.x, other.y, -3)
        }

instance_create(averageX,averageY,RainbowSpirit)

if ds_list_find_index(GameRunner.levelList, room) + 2 > GameRunner.currentLevel
    GameRunner.currentLevel = ds_list_find_index(GameRunner.levelList, room) + 2


file = file_text_open_read("the_bond_level_tracker.txt")
loadedLevel = real(file_text_readln(file))
file_text_readln(file);
file_text_close(file)

if loadedLevel < GameRunner.currentLevel
    {
    file = file_text_open_write("the_bond_level_tracker.txt");
    file_text_write_string(file, string(GameRunner.currentLevel));
    file_text_writeln(file);
    file_text_close(file);
    }

instance_destroy(BlackSpirit)
instance_destroy()


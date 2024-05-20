/// @description Set Vars

surface_resize(application_surface, room_width, room_height)

mainFont = font_add_sprite(FontSpr, ord("!"), true, 2);
draw_set_font(mainFont)


if file_exists("the_bond_level_tracker.txt")
    {
    file = file_text_open_read("the_bond_level_tracker.txt")
    currentLevel = real(file_text_readln(file))
    file_text_readln(file);
    file_text_close(file)
    }
else
    {
    currentLevel = 1
    file = file_text_open_write("the_bond_level_tracker.txt");
    file_text_write_string(file, string(currentLevel));
    file_text_writeln(file);
    file_text_close(file);
    }    

///Create Ground Array

/* */
///Music

music[0] = Music1
music[1] = Music2
music[2] = Music3

lastMusic = music[0]
currentMusic = music[0]
audio_play_sound(currentMusic, 1, false)


/* */
/*  */

levelList = ds_list_create()
ds_list_add(levelList, GameRoom1, GameRoom2, GameRoom3, GameRoom4, GameRoom5, GameRoom6, GameRoom7, GameRoom8, GameRoom9, GameRoom10, GameRoom11, GameRoom12, GameRoom13, GameRoom14, GameRoom15, GameRoom16, GameRoom17, GameRoom18);
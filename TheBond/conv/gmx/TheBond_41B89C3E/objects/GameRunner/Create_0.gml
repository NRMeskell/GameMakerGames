/// @description Set Vars

surface_resize(application_surface, room_width, room_height)

mainFont = font_add_sprite(FontSpr, ord("!"), true, 2);
draw_set_font(mainFont)


if file_exists("file.txt")
    {
    file = file_text_open_read("file.txt")
    currentLevel = real(file_text_readln(file))
    file_text_readln(file);
    file_text_close(file)
    }
else
    {
    currentLevel = 1
    file = file_text_open_write("file.txt");
    file_text_write_string(file, string(currentLevel));
    file_text_writeln(file);
    file_text_close(file);
    }    

///Create Ground Array

/*for(i=0; i<1000; i++)
    {
    global.groundArray[i] = irandom(sprite_get_number(GroundDeadSpr)-1)
    }

/* */
///Music

music[0] = Music3
music[1] = Music1
music[2] = Music2

lastMusic = music[0]
currentMusic = music[0]
audio_play_sound(currentMusic, 1, false)


/* */
/*  */

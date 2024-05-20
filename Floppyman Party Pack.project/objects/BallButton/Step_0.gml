var __b__;
__b__ = action_if_variable(CharacterCreator.inMenu, true, 0);
if __b__
{
///Mouse over and clicked

mouseOver = point_in_rectangle(mouse_x, mouse_y, x-16, y-16, x+16, y+16)

if mouseOver and global.selectClick and !CharacterCreator.creatingCharacter
    {
    audio_play_sound(ClickSound, 1, false)
    if selected
        {
        selected = false
        with DodgeBallTimer
            ds_list_delete(ballList, ds_list_find_index(ballList, other.ball))
        }
    else
        {
        selected = true
        with DodgeBallTimer
            ds_list_add(ballList, other.ball)
        }
    }

}

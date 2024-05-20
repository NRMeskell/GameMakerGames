var __b__;
__b__ = action_if_variable(CharacterCreator.inMenu, true, 0);
if __b__
{
///Over Arrows

overRight = point_in_rectangle(mouse_x, mouse_y, x + xButtonWidth - 10, y - 16, x + xButtonWidth + 10, y + 16) and !CharacterCreator.creatingCharacter
overLeft = point_in_rectangle(mouse_x, mouse_y, x - xButtonWidth - 10, y - 16, x - xButtonWidth + 10, y + 16) and !CharacterCreator.creatingCharacter

if global.selectClick
    {
    if overRight
        {
        audio_play_sound(ClickSound, 1, false)
        global.golfBall ++
        if global.golfBall = array_length(ballType)
            global.golfBall = 0
       }
        
    if overLeft
        {
        audio_play_sound(ClickSound, 1, false)
        global.golfBall --
        if global.golfBall < 0
            global.golfBall = array_length(ballType) -1
        }
    }

}

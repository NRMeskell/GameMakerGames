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
        buttonNumber ++
        if buttonNumber > 4
            buttonNumber = 4
        DodgeBallTimer.dropRate = DodgeBallTimer.dropRates[buttonNumber]
        }
        
    if overLeft
        {
        audio_play_sound(ClickSound, 1, false)
        buttonNumber --
        if buttonNumber < 0
            buttonNumber = 0
            
        DodgeBallTimer.dropRate = DodgeBallTimer.dropRates[buttonNumber]
        }
    }

}

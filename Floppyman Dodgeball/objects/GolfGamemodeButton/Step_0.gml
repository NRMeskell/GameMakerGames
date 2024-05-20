/// @description slide in from left

if x < myX
    x += abs(x-myX)*sqrt(global.timeDiff)/10

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
        mode ++
        if mode > 1
            mode = 0
        CharacterCreator.gamemode = CharacterCreator.gamemodes[mode + 3]
        audio_play_sound(ClickSound, 1, false)
        }
        
    if overLeft
        {
        mode --
        if mode < 0
            mode = 1
        CharacterCreator.gamemode = CharacterCreator.gamemodes[mode + 3]
        audio_play_sound(ClickSound, 1, false)
        }
    }

}

if room = PartyPackRoom
{
///Draw

draw_self()
if overRight
    draw_sprite_ext(MenuArrowSpr, 0, x + xButtonWidth, y, 1, 1, 0, c_ltgray, 1)
else
    draw_sprite_ext(MenuArrowSpr, 0, x + xButtonWidth, y, 1, 1, 0, c_white, 1)
    
if overLeft
    draw_sprite_ext(MenuArrowSpr, 0, x - xButtonWidth, y, -1, 1, 0, c_ltgray, 1)
else
    draw_sprite_ext(MenuArrowSpr, 0, x - xButtonWidth, y, -1, 1, 0, c_white, 1)
    
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if CharacterCreator.gamemode = CharacterCreator.gamemodes[0]
    displayString = "LIVES"
if CharacterCreator.gamemode = CharacterCreator.gamemodes[1]
    displayString = "POINTS"
if CharacterCreator.gamemode = CharacterCreator.gamemodes[2]
    displayString = "MINUTES"

draw_text(x, y, string_hash_to_newline(string(stock) + " " + displayString))

}

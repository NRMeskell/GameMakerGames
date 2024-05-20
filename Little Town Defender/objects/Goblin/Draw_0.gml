/// @description Health Bar

if Health > 0
{
HealthRed = make_colour_hsv(0,220,160)

draw_rectangle_color(x - 8, y + 5, x + 8, y + 7, c_black, c_black, c_black, c_black, false)

HealthGreen = make_colour_hsv(80,220,80)
draw_rectangle_colour(x - 8, y + 5, x - 8 + ((Health/MaxHealth) * 16), y + 7, HealthRed, HealthRed, HealthRed, HealthRed, false)

draw_rectangle_color(x - 8, y + 5, x + 8, y + 7, c_black, c_black, c_black, c_black, true)
}

///Draw Fire

draw_self()

if Fire = true
    {
    
    }

///Draw Armor

CheckArmor = Armor

Distance = Armor + MagicArmor - 1
    
for(i=0; i < Armor + MagicArmor; i++)
{
if CheckArmor > 0
    {
    draw_sprite(ArmorSpr, 0, (x - sprite_get_width(ArmorSpr) * Distance) + ((sprite_get_width(ArmorSpr)*1.5) * i), y - sprite_height/2 + 20)
    CheckArmor -= 1
    }
else
    {
    draw_sprite_ext(ArmorSpr, 0, (x - sprite_get_width(ArmorSpr) * Distance) + ((sprite_get_width(ArmorSpr)*1.5) * i), y - sprite_height/2 + 20, 1, 1, 0, c_fuchsia	, 1)
    }
}


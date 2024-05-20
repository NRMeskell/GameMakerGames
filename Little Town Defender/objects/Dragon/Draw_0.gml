/// @description Draw Head

if image_index div 1 = 16
    HeadPlace = -1

if image_index div 1 = 0 or image_index div 1 = 14
    HeadPlace = 0
    
if image_index div 1 = 2 or image_index div 1 = 12
    HeadPlace = 1
    
if image_index div 1 = 7
    HeadPlace = 2
    

draw_self()

HeadDir = point_direction(x,y, GoTo.x, GoTo.y - GoTo.sprite_height/2)



if distance_to_point(GoTo.x, GoTo.y) < 125
{
if image_xscale = 1
draw_sprite_ext(DragonHead, 0, x, y + HeadPlace, 1, 1, HeadDir, c_white, 1)

if image_xscale = -1
draw_sprite_ext(DragonHead, 0, x, y + HeadPlace, -1, 1, HeadDir - 180, c_white, 1)
}
else
    draw_sprite_ext(DragonHead, 0, x, y + HeadPlace, image_xscale, 1, 0, c_white, 1)

///Draw Armor

CheckArmor = Armor

Distance = Armor + MagicArmor - 1
    
for(i=0; i < Armor + MagicArmor; i++)
{
if CheckArmor > 0
    {
    draw_sprite(ArmorSpr, 0, (x - sprite_get_width(ArmorSpr) * Distance) + ((sprite_get_width(ArmorSpr)*1.5) * i), y - sprite_height/2 + 25)
    CheckArmor -= 1
    }
else
    {
    draw_sprite_ext(ArmorSpr, 0, (x - sprite_get_width(ArmorSpr) * Distance) + ((sprite_get_width(ArmorSpr)*1.5) * i), y - sprite_height/2 + 25, 1, 1, 0, c_fuchsia, 1)
    }
}

///Health Bar


HealthRed = make_colour_hsv(0,220,160)
HealthGreen = make_colour_hsv(80,220,80)

Center = x - sign(image_xscale) * 5
Down = y + 50
Width = 25
Hieght = 2

draw_rectangle_color(Center - Width, Down - Hieght, Center + Width, Down + Hieght, c_black, c_black, c_black, c_black, false)
draw_rectangle_colour(Center - Width, Down - Hieght, Center - Width + ((Health/MaxHealth) * Width* 2), Down + Hieght, HealthRed, HealthRed, HealthRed, HealthRed, false)
draw_rectangle_color(Center - Width, Down - Hieght, Center + Width, Down + Hieght, c_black, c_black, c_black, c_black, true)


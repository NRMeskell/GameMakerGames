/// @description Crumble

BuildWidth = sprite_get_width(sprite_index)

if (sprite_index != WoodDam2 and sprite_index != StoneDam2)
for (i = 0; i < BuildWidth; i+=1)
    {
    if Fall > 0
        {
        BuildTop = sprite_height * Fall div 100 + irandom_range(-2,2)
        }
    draw_sprite_part_ext(sprite_index, image_index, i, sprite_height - BuildTop, 1, BuildTop, x + 1 - BuildWidth/2 + i, y - BuildTop, 1, 1, c_white, image_alpha);
    }
    
if (sprite_index = WoodDam2 or sprite_index = StoneDam2)
{
if image_index = 0
for (i = 0; i < BuildWidth; i+=1)
    {
    if Fall > 0
        {
        BuildTop = 20 * Fall div 100 + irandom_range(-2,2)
        }
    draw_sprite_part_ext(sprite_index, image_index, i, sprite_height - 15 - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y + 3 - BuildTop, 1, 1, c_white, image_alpha);
    }
    
if image_index = 2
for (i = 0; i < BuildWidth; i+=1)
    {
    if Fall > 0
        {
        BuildTop = 55 * Fall div 100 + irandom_range(-2,2)
        }
    draw_sprite_part_ext(sprite_index, image_index, i, sprite_height - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y + 18 - BuildTop, 1, 1, c_white, image_alpha);
    }

if image_index = 1
for (i = 0; i < BuildWidth; i+=1)
    {
    if Fall > 0
        {
        BuildTop = sprite_height * Fall div 100 + irandom_range(-2,2)
        }
    draw_sprite_part_ext(sprite_index, image_index, i, sprite_height - BuildTop + i, 1, BuildTop, x - BuildWidth/2 + i, y + 18 - BuildTop + i, 1, 1, c_white, image_alpha);
    }
    
if image_index = 3
for (i = 0; i < BuildWidth; i+=1)
    {
    if Fall > 0
        {
        BuildTop = sprite_height * Fall div 100 + irandom_range(-2,2)
        }
    draw_sprite_part_ext(sprite_index, image_index, i, sprite_height + 32 - BuildTop - i, 1, BuildTop, x - BuildWidth/2 + i, y + 50 - BuildTop - i, 1, 1, c_white, image_alpha);
    }
}
    
Fall -= 2


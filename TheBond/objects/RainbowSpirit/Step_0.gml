/// @description Alive Circle

shadeImage += imageSpeed;
if shadeImage >= sprite_get_number(SpiritShadeSpr)
    shadeImage = 0

r += 5
        
with GroundTile
    if point_distance(x,y,other.x, other.y+sprite_get_height(WhiteSpiritSpr)/2) < other.r and dead
        {
        dead = !dead
        if irandom(100) = 0 and instance_number(Butterfly) < 8
            instance_create(x,y,Butterfly)
            
        sprite_index = ds_map_find_value(groundMap, sprite_index)
        if sprite_index == WaterEdgeSpr
            if image_index == 0{
                image_speed = 4/room_speed
                image_index = irandom(3)
                }
            else
                instance_destroy()
        }
        
if irandom(10) = 0
    with instance_create(x+irandom_range(-10,10), y+sprite_get_height(WhiteSpiritSpr)/2+irandom_range(-10,10), Cloud)
        {
        image_blend = choose(c_white, c_black, c_red, c_aqua, c_lime, c_orange, c_purple, c_yellow)
        image_index = 2+irandom(2)
        shrinkSpeed = 8
        image_speed = 0
        image_angle = choose(0,90,180,270)
        move_towards_point(other.x, other.y+sprite_get_height(WhiteSpiritSpr)/2, -1)
        depth = 0
        }


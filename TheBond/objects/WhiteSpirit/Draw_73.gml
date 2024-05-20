//Make clouds
cloudDistance = random(1)
createX = cos(degtorad(point_direction(x,y+sprite_get_height(WhiteSpiritSpr)/2,BlackSpirit.x, BlackSpirit.y+sprite_get_height(WhiteSpiritSpr)/2)))*point_distance(x,y,BlackSpirit.x, BlackSpirit.y+sprite_get_height(WhiteSpiritSpr)/2)*cloudDistance
createY = -sin(degtorad(point_direction(x,y+sprite_get_height(WhiteSpiritSpr)/2,BlackSpirit.x, BlackSpirit.y+sprite_get_height(WhiteSpiritSpr)/2)))*point_distance(x,y,BlackSpirit.x, BlackSpirit.y+sprite_get_height(WhiteSpiritSpr)/2)*cloudDistance

if irandom(5) = 0
with instance_create(x+createX, y+createY+sprite_get_height(WhiteSpiritSpr)/2, Cloud)
    {
    image_blend = merge_color(c_white, c_black, other.cloudDistance)
    image_index = 4 + irandom(1)
    shrinkSpeed = 4
    image_speed = 0
    image_angle = choose(0,90,180,270)
    depth = -2
    }


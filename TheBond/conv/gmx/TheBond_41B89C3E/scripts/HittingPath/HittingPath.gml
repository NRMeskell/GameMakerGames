
if collision_line(WhiteSpirit.x, WhiteSpirit.y+sprite_get_height(WhiteSpiritSpr)/2, BlackSpirit.x, BlackSpirit.y+sprite_get_height(BlackSpiritSpr)/2, self, false, false) or place_meeting(x,y,WhiteSpirit) or place_meeting(x,y,BlackSpirit)
    return true
else
    return false

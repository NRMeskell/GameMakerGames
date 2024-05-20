//temp

//draw_sprite(TikiHead1Spr, 0, mouse_x, mouse_y)
//draw_text(100, 100, string(mouse_x) + ", " + string(mouse_y))

var __b__;
__b__ = action_if_variable(view_current, 0, 0);
if __b__
{
{
///Draw Behind Events

with EventDrawer
    if !inFront
        {
        myLayer = 2
        event_user(0)
        }
       
if global.weather == 2
    draw_sprite(RainSpr, flagSpr, 0, 0)

///Draw Self

myLayer = 3

if instance_exists(CombatRunner)
    drawX = drawX + CombatRunner.currentDistance div 3

DrawShip(hullDict[shipType], sprite_get_number(ShipSloopSpr)*(1-max(0.01,((myHealth)/maxHealth))), drawX, GetWaterLevel(middleWaves, drawX) + sinking, realRock/2, c_white, PirateFlagSpr, c_white, 3)

///Draw Front Events

with EventDrawer
    if inFront
        {
        myLayer = 3
        event_user(0)
        }
               
if global.weather == 2
    draw_sprite(RainSpr, flagSpr + 2, 0, 0)


///Draw Mddle Waves

//Ship Waves
with middleWaves
	event_user(0)

///Draw Port/Land Back

with PortDrawerBack
    {
    myLayer = 3
    event_user(1)
    }

//draw objects   
with DrawPort
    if (mySlot = 0 or mySlot = 2) and x != -50
        {
        DrawWithLighting(sprite_index, Ship.animate, x, y, 0, c_white, 1, 3)
        DrawLandMenu()
        }
        
animate += 12/60
    
with PortDrawerBack
    {
    myLayer = 3
    event_user(0)
    }
}	
}


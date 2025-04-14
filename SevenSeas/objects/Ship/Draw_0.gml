if (view_current == 0)
{
{
///Draw Behind Events

with EventDrawer{
    myLayer = 2
    event_user(0)
}

///Draw Self

myLayer = 3

if instance_exists(CombatRunner)
    drawX = drawX + CombatRunner.currentDistance div 3

if global.weather == 2
	with WeatherController
		event_user(2)

DrawShip(global.hullDict[shipType], sprite_get_number(ShipSloopSpr)*(1-max(0.01,((myHealth)/maxHealth))), drawX, GetWaterLevel(middleWaves, drawX) + sinking, realRock/2, c_white, PirateFlagSpr, c_white, 3)

///Draw Front Events

with EventDrawer{
    myLayer = 3
    event_user(1)
}

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
	
	
with BirdEvent{
    myLayer = 3
    event_user(1)
} 

with LandFlavor{
    myLayer = 3
    event_user(1)
} 

}	
}


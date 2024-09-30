if (view_current == 0)
{
{
with SailingDecor if y == Ship.frontWaves.waveBase
	event_user(0)
	
if global.weather == 2
	with WeatherController
		event_user(3)
		
with Cloud
	event_user(0)
	
///Draw Front Waves
with frontWaves
	event_user(0)

///Draw Port/Land Front
with PortDrawerFront
    {
    myLayer = 4
    event_user(1)
    }

with DrawPort
    if mySlot = 1 and x != -50
        {
        DrawWithLighting(sprite_index, Ship.animate, x, y, 0, c_white, 1, 4)
        DrawLandMenu()
        }

        
with PortDrawerFront
    {
    myLayer = 4
    event_user(0)
    }
}
}

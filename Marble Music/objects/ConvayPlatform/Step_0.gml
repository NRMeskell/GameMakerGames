/// @description Start Tilting
// You can write your code in this editor

if GameController.convOn{
	phy_position_y -= 50/room_speed

	if y<60{
		phy_rotation -= tilt*(40/room_speed)
		if y < -50{
			instance_destroy()
		}
	}
}
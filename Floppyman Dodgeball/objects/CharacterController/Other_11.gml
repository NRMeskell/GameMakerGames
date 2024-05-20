/// @description Found Marker Golf

if !golfHitting and !stunned{
myMarker.ready = false
with myMarker{
	if  (collision_line(x, y, x, y+1, GreenParent, true, false)) and !collision_line(x, y, x, y+1, GrassDrawer, true, false)
		other.throwAngle = 180*(x < GolfFlag.x)
	else
		other.throwAngle = 90
	}
golfHitting = true
golfSwinging = false
golfStrike = false
startSwingTime = current_time
swingForce = 0
golfCharging = false

myClub = instance_create(myMarker.x, myMarker.y - sprite_get_height(GolfClubSpr) + 5, GolfClub)
myClub.myCharacter = id

for(i=0; i<array_length_1d(bodyPart); i++)
     with bodyPart[i]
         {
         phy_position_y = other.myClub.y
         phy_position_x = other.myClub.x
         phy_rotation = 0
         phy_speed_x = 0
         phy_speed_y = 0
         }

body.phy_position_x = myClub.x
body.phy_position_y = myClub.y
body.phy_rotation = 0

hand1.phy_position_x = myClub.x
hand1.phy_position_y = myClub.y + 16
hand1.phy_rotation = 90

hand2.phy_position_x = myClub.x
hand2.phy_position_y = myClub.y + 16
hand2.phy_rotation = 90

foot1.phy_rotation = 45
foot2.phy_rotation = -45

physics_joint_revolute_create(myClub, hand1, myClub.x, myClub.y + 24, 0, 0, false, 0, 0, 0, false)
physics_joint_revolute_create(myClub, hand2, myClub.x, myClub.y + 24, 0, 0, false, 0, 0, 0, false)
physics_joint_revolute_create(myClub, body, myClub.x, myClub.y, 0, 0, false, 0, 0, 0, false)
}


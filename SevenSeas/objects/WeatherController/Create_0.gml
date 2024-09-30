/// @description Weather

cloudNum[0] = 2
cloudNum[1] = 6
cloudNum[2] = 18

global.weather = 1
weatherTimer = random_range(room_speed*60*2, room_speed*60*6)
cloudNumber = cloudNum[1]

///Make Clouds

repeat(cloudNumber)
    event_user(0)
	
frontRainX = 0
backRainX = 0
frontRainY = 0
backRainY = 0
frontRainSpeed = 20
backRainSpeed = 15

myWind = audio_play_sound(HowlingWindSnd, 0, true)
audio_stop_sound(myWind)

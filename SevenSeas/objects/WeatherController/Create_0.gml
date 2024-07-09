/// @description Weather

cloudNum[0] = 5
cloudNum[1] = 10
cloudNum[2] = 30

global.weather = 1
weatherTimer = random_range(room_speed*60*2, room_speed*60*6)
cloudNumber = cloudNum[1]

///Make Clouds

repeat(cloudNumber)
    event_user(0)


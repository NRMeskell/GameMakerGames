/// @description Fonts

display_set_gui_size(room_width, room_height);

///Waves Vars

landMap = ds_map_create()
landMap[? global.seaNames[0]] = PirateCoveLand

//land
landX = 0
landSpeed = 0
landYShift = -30
landDrawShift = 0
islandPoint[0] = 0
islandPoint[1] = 298
islandPoint[2] = 568

skyAmount = 0.5

//waves
waveConst = 5
shipMoved = 0

shipMapXMax = 47
shipMapX = 0

enemyMoved = 50
enemyWaveHeight = 0
enemyRealRock = 0

///make clouds
instance_create(0,0,WeatherController)
///Create Clock

with instance_create(0,0,Clock)
    global.timeCycle = room_speed*10
	
backWaves = instance_create(0,0,WaveController)
with backWaves{
	waveBase = 130
	waveColor = make_color_rgb(6, 26, 136)
	waveLayer = 2
	waveHeights = [10, 4]
	waveSpeeds = [0.3, 0.1]
	waveWidths = [80, 25]
	waveAlpha = 1
}
middleWaves = instance_create(0,0,WaveController)
with middleWaves{
	waveBase = 100
	waveColor = make_color_rgb(32, 66, 186)
	waveLayer = 2
	waveHeights = [10, 4]
	waveSpeeds = [0.5, 0.2]
	waveWidths = [70, 30]
	waveAlpha = 0.95
}
frontWaves = instance_create(0,0,WaveController)
with frontWaves{
	waveBase = 65
	waveColor = make_color_rgb(88, 105, 230)
	waveLayer = 2
	waveHeights = [10, 4]
	waveSpeeds = [0.75, 0.3]
	waveWidths = [50, 20]
	waveAlpha = 0.9
}


/// @description Gameplay Vars

if global.resolution
	sceneBackground = surface_create(1920, 1080)
else
	sceneBackground = surface_create(room_width, room_height)

show_debug_overlay(true)

global.myLayer = 0
global.storeSize[0] = 100
global.storeSize[1] = 10
global.storeSize[2] = 10
global.storeSize[3] = 10
global.storeSize[4] = 10
global.storeSize[5] = 10
global.storeSize[6] = 10
global.storeSize[7] = 10
global.storeSize[8] = 10
global.storeSize[9] = 10
global.storeSize[10] = 10

randomize();

dumpX = 215
dumpY = 275
realWidth = 25
realHeight = 25

hitAmount = 0

global.totalWheelBonus = 0
global.totalSailBonus = 0
global.totalRiggingBonus = 0
global.totalMedicalBonus = 0
global.totalCannonBonus = 0
global.totalSurvivalBonus = 0

global.totalGunBonus = 0
global.totalSwordBonus = 0

moralDisplay[0] = "Dismal"
moralDisplay[1] = "Low"
moralDisplay[2] = "Fair"
moralDisplay[3] = "High"
moralDisplay[4] = "Great"

shipType = 0
damage = 0

maxHealth = global.maxHealthType[0]
myHealth = maxHealth
healthDiff = maxHealth
updateHealthDiff = false
healthDiffTimer = 0

///Waves Vars

landMap = ds_map_create()
landMap[? global.seaNames[0]] = PirateCoveLand
landMap[? global.seaNames[1]] = TropicalIslandLand
landMap[? global.seaNames[2]] = ShipwreckShoreLand
landMap[? global.seaNames[3]] = SeaOfDeadLand
landMap[? global.seaNames[4]] = VolcanicIslandLand
landMap[? global.seaNames[5]] = PirateCoveLand
landMap[? global.seaNames[6]] = PirateCoveLand

//land
landX = 0
landSpeed = 0.55
landYShift = -30
landDrawShift = 0
islandPoint[0] = 0
islandPoint[1] = 298
islandPoint[2] = 568

skyAmount = 0.5

backWaves = instance_create(0,0,WaveController)
with backWaves{
	waveBase = 150
	waveColor = make_color_rgb(6, 26, 136)
	waveLayer = 2
	waveHeights = [6, 3]
	waveSpeeds = [0.75, 0.3]
	waveWidths = [80, 25]
	waveAlpha = 1
}
middleWaves = instance_create(0,0,WaveController)
with middleWaves{
	waveBase = 120
	waveColor = make_color_rgb(32, 66, 186)
	waveLayer = 2
	waveHeights = [10, 4]
	waveSpeeds = [1.5, 0.5]
	waveWidths = [70, 30]
	waveAlpha = 0.95
}
frontWaves = instance_create(0,0,WaveController)
with frontWaves{
	waveBase = 90
	waveColor = make_color_rgb(88, 105, 230)
	waveLayer = 2
	waveHeights = [12, 5]
	waveSpeeds = [2.0, 0.7]
	waveWidths = [60, 35]
	waveAlpha = 0.9
}

//waves
sinking = 0

rockSpeed = random_range(0.2,0.4)
rockRotation = 0
rockScale = 0.75
rockTo = irandom_range(5,10)

waveHeight = 0
waveSpeed = random_range(0.1, 0.2)
waveConst = 5
shipMoved = 0

shipMapXMax = 47
shipMapX = 0

enemyMoved = 50
enemyWaveHeight = 0
enemyRealRock = 0

///Menu Vars

myStatsSprDict[0] = 0
myStatsSprDict[1] = 1
myStatsSprDict[2] = 2
myStatsSprDict[3] = 3
myStatsSprDict[4] = 4
myStatsSprDict[5] = 5
myStatsSprDict[6] = 6

myStatsNumList = ds_list_create()
myStatsNumList[0] = 0
myStatsNumList[1] = 0
myStatsNumList[2] = 0
myStatsNumList[3] = 0
myStatsNumList[4] = 0
myStatsNumList[5] = 0
myStatsNumList[6] = 0



statsStartX = 40
statsDistance = sprite_get_width(StatMenuSpr)/6 - (statsStartX - 20)/6

flagSpr = 0
animateFlag = 0

drawX = room_width/2 - 5
drawY = room_height/2 + 50

//image_speed = 0
//image_index = 0

menuSize = 1.25
shipSize = 1

xWindow = 70
yWindow = 20

global.menuShipLayer = 0

///Pirate List

drawTagX = 0
drawTagY = -5

global.allowSelect = true

global.crewSize = 0
global.slotPosition = 0

drawPiratePostNumber = 4
tagShift = 0

global.crewList = ds_list_create()
healSpeed = 0//1/room_speed

listPositionX = 36
listPositionUpY = 60
listPositionDownY = 315

overListUp = false
overListDown = false

global.moraleBoost = "unknown"
for(i=0; i<4; i++)
    global.pirateNum[i] = 0

///Port Vars

drawPortShiftX = 0
drawPortShiftY = 15

overShipPort = false

portSelect = false

global.portType = 1
drawPortBack = Port1Back
drawPortFront = Port1Front

animate = 0

global.doTime = false


///Create Starting Pirates

alarm[0] = 1

///ShipButtons

buttonX = 37
buttonY = 295

///Double Click vars

doubleClickTimerLength = 30
global.doubleClickTimer = 0

doubleClickX = 0
doubleClickY = 0 

myStoreCargoType = -1 

allowShipActions = true
allowMeleeActions = true
allowRangedActions = true
allowCannonActions = true

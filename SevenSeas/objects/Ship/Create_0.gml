/// @description Gameplay Vars

if global.modernRes
	sceneBackground = surface_create(display_get_gui_width(), display_get_height())
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

randomize();

dumpX = 215
dumpY = 275
realWidth = 25
realHeight = 25

hitAmount = 0

global.gameSpeed = 1

global.actionsLeft = 0

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

///Ship Types

shipType = 0
damage = 0

shipMaxCrew[0] = 4
shipMaxCrew[1] = 5
shipMaxCrew[2] = 5
shipMaxCrew[3] = 5
shipMaxCrew[4] = 6
shipMaxCrew[5] = 6
shipMaxCrew[6] = 6

shipName[0] = "Sloop"
shipName[1] = "Schooner"
shipName[2] = "Caravel"
shipName[3] = "Brigantine"
shipName[4] = "Galleon"
shipName[5] = "Man O' War"
shipName[6] = "Frigate"

shipDescription[0] = "A small seaworthy craft"
shipDescription[1] = "A fast, slim-hulled sailing ship"
shipDescription[2] = "A reliable transport vessel"
shipDescription[3] = "A mid-sized sturdy gunboat"
shipDescription[4] = "A triple-masted storage ship"
shipDescription[5] = "A large, powerful warship"
shipDescription[6] = "A formidable sailing vessel"

maxHealthType[0] = 250
maxHealthType[1] = 500
maxHealthType[2] = 500
maxHealthType[3] = 600
maxHealthType[4] = 1000
maxHealthType[5] = 1250
maxHealthType[6] = 1000

maxHealth = maxHealthType[shipType]
myHealth = maxHealth
healthDiff = maxHealth
updateHealthDiff = false
healthDiffTimer = 0

menuShipSprs[0] = MenuShipSloopSpr
menuShipSprs[1] = MenuShipScoonerSpr
menuShipSprs[2] = MenuShipCaravelSpr
menuShipSprs[3] = MenuShipBrigSpr


flagX[0] = -1
flagY[0] = 29-96

flagX[1] = 0
flagY[1] = 25-96

flagX[2] = -2
flagY[2] = 25-96

flagX[3] = 75-65
flagY[3] = 29-96



hullDict[0] = ShipSloopSpr
hullDict[1] = ShipScoonerSpr
hullDict[2] = ShipCaravelSpr
hullDict[3] = ShipBrigSpr

//rigging
shipSlots[0,0] = 2
shipSlots[0,1] = 3
shipSlots[0,2] = 2
shipSlots[0,3] = 2
shipSlots[0,4] = 3
shipSlots[0,5] = 2
shipSlots[0,6] = 3
//cannon
shipSlots[1,0] = 1
shipSlots[1,1] = 1
shipSlots[1,2] = 1
shipSlots[1,3] = 2
shipSlots[1,4] = 1
shipSlots[1,5] = 3
shipSlots[1,6] = 2
//bed
shipSlots[2,0] = 1
shipSlots[2,1] = 1
shipSlots[2,2] = 2
shipSlots[2,3] = 2
shipSlots[2,4] = 2
shipSlots[2,5] = 2
shipSlots[2,6] = 3
//cargo
shipSlots[3,0] = 4
shipSlots[3,1] = 5
shipSlots[3,2] = 5
shipSlots[3,3] = 4
shipSlots[3,4] = 6
shipSlots[3,5] = 4
shipSlots[3,6] = 5

///Waves Vars

landMap = ds_map_create()
landMap[? global.seaNames[0]] = PirateCoveLand
landMap[? global.seaNames[1]] = TropicalIslandLand
landMap[? global.seaNames[2]] = PirateCoveLand
landMap[? global.seaNames[3]] = PirateCoveLand
landMap[? global.seaNames[4]] = PirateCoveLand
landMap[? global.seaNames[5]] = PirateCoveLand
landMap[? global.seaNames[6]] = PirateCoveLand

//land
landX = 0
landSpeed = 0.55
landYShift = -30
landDrawShift = 0
islandPoint[0] = 0
islandPoint[1] = 298
islandPoint[2] = 562
islandPoint[3] = 883
islandPoint[4] = 1200

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

global.eventOpen = false

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

drawX = room_width/2 - 5 + 26*instance_exists(Event)
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
drawTagY = 10

global.allowSelect = true

global.crewSize = 0
global.slotPosition = 0

drawPiratePostNumber = 4
tagShift = 10

global.crewList = ds_list_create()
healSpeed = 1/(room_speed*60)

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

portFrontMap = ds_map_create()
portFrontMap[? global.seaNames[0]] = Port1Front
portFrontMap[? global.seaNames[1]] = Port2Front
portFrontMap[? global.seaNames[2]] = Port1Front
portFrontMap[? global.seaNames[3]] = Port1Front
portFrontMap[? global.seaNames[4]] = Port1Front
portFrontMap[? global.seaNames[5]] = Port1Front
portFrontMap[? global.seaNames[6]] = Port1Front

portBackMap = ds_map_create()
portBackMap[? global.seaNames[0]] = Port1Back
portBackMap[? global.seaNames[1]] = Port2Back
portBackMap[? global.seaNames[2]] = Port1Back
portBackMap[? global.seaNames[3]] = Port1Back
portBackMap[? global.seaNames[4]] = Port1Back
portBackMap[? global.seaNames[5]] = Port1Back
portBackMap[? global.seaNames[6]] = Port1Back


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

myStoreItemType = -1 

allowShipActions = true
allowMelleActions = true
allowRangedActions = true
allowCannonActions = true

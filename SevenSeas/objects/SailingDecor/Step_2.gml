/// @description float away

if y = Ship.frontWaves.waveBase
	x -= (Ship.frontWaves.waveSpeeds[0]/4)*!global.mapPause*global.doTime*(MapShip.path_speed/MapShip.normalSailSpeed)*max(1, global.doTime*global.gameRate)
else
	x -= (Ship.backWaves.waveSpeeds[0]/2)*!global.mapPause*global.doTime*(MapShip.path_speed/MapShip.normalSailSpeed)*max(1, global.doTime*global.gameRate)


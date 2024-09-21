/// @description Insert description here
// You can write your code in this editor

wdw = 20
waveBase = 100
waveColor = make_color_rgb(36, 51, 152)
waveLayer = 1
waveAlpha = 0.9
waveHeights = [10, 4]
waveSpeeds = [1, 0.5]
waveWidths = [70, 30]
waveOffsets = [irandom(room_width), irandom(room_width)]

oceanColor = ds_map_create()
oceanColor[? global.seaNames[0]] = make_color_rgb(36, 51, 152)
oceanColor[? global.seaNames[1]] = make_color_rgb(23, 75, 130)
oceanColor[? global.seaNames[2]] = make_color_rgb(60, 66, 130)
oceanColor[? global.seaNames[3]] = make_color_rgb(90, 80, 150)
oceanColor[? global.seaNames[4]] = make_color_rgb(36, 51, 152)
oceanColor[? global.seaNames[5]] = make_color_rgb(36, 51, 152)
oceanColor[? global.seaNames[6]] = make_color_rgb(36, 51, 152)

waveDirection = 1
waveAmplifier = 1
waveMovement = 1
waveMin = 0
waveMax = room_width

surfaceHeight = waveBase + 2*(waveHeights[0] + waveHeights[1])






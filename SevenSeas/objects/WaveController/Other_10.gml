/// @description Draw Water
// You can write your code in this editor

if surfaceHeight != waveBase + waveHeights[0] + waveHeights[1]
	surfaceHeight = waveBase + waveHeights[0] + waveHeights[1]
waterSurface = surface_create(room_width, surfaceHeight)
surface_set_target(waterSurface)

if global.lighting < 2
	var wave_color = make_color_hsv(colour_get_hue(waveColor), colour_get_saturation(waveColor), (color_get_value(waveColor)+colour_get_value(Clock.skyColor))/2)
else
	var wave_color = waveColor
	
var foam = merge_color(merge_color(c_white, Clock.skyColor, 0.5+0.3*(global.lighting != 2)), waveColor, max(0, 0.6-0.2*(global.lighting != 2)))
	
var tex = sprite_get_texture(WaveSpr, 0);
var waveDis = texture_get_texel_width(tex)*20*0.8
var foamTex = sprite_get_texture(FoamSpr, 0);
	
var height = GetWaterLevel(id, 0)
var waveAngle = 0
var textureNum = waveOffsets[0]/sprite_get_width(WaveSpr)*wdw
for(var r=waveMin; r<waveMax/wdw; r+=1){
	var nextHeight = GetWaterLevel(id, (r+1)*wdw)
	var nextWaveAngle = abs(power(GetWaterAngle(id, (r+1)*wdw), 2))/100
	//nextWaveAngle = nextWaveAngle >= 0.5 ? nextWaveAngle : 0
	
	//draw wave
	var startTex = (waveDis*textureNum) mod 0.8
	draw_primitive_begin_texture(pr_trianglestrip, tex);
	draw_vertex_texture_color(r*wdw, height - (room_height-surfaceHeight), startTex, 0, waveColor, waveAlpha);
	draw_vertex_texture_color((r+1)*wdw, nextHeight - (room_height-surfaceHeight), startTex + waveDis, 0, waveColor, waveAlpha);
	draw_vertex_texture_color(r*wdw, 300, startTex, 1, waveColor, waveAlpha);
	draw_vertex_texture_color((r+1)*wdw, 300, startTex + waveDis, 1, waveColor, waveAlpha);
	draw_primitive_end();

	//draw foam
	if global.lighting == 2{
		//if nextWaveAngle >= 0.5 or waveAngle >= 0.5{
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex_color(r*wdw, height - (room_height-surfaceHeight)-waveAngle, foam, 1);
			draw_vertex_color((r+1)*wdw, nextHeight - (room_height-surfaceHeight)-nextWaveAngle, foam, 1);
			draw_vertex_color(r*wdw, height - (room_height-surfaceHeight), foam, 1);
			draw_vertex_color((r+1)*wdw, nextHeight - (room_height-surfaceHeight), foam, 1);
			draw_primitive_end();
		
	}
	
	draw_set_color(merge_color(wave_color, c_black, 0.5))
	draw_line_width(r*wdw-1, height - (room_height-surfaceHeight)-waveAngle-1, (r+1)*wdw-1, nextHeight - (room_height-surfaceHeight)-nextWaveAngle-1, 1);
	
	textureNum ++
	height = nextHeight
	waveAngle = nextWaveAngle
	}
surface_reset_target()

DrawWaterSurfaceWithLighting(waterSurface, 0, (room_height-surfaceHeight), 1, 1, c_white, 1, waveLayer)
surface_free(waterSurface)
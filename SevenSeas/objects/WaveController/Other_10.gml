/// @description Draw Water
// You can write your code in this editor

if surfaceHeight != waveBase + 2*(waveHeights[0] + waveHeights[1]){
	surfaceHeight = waveBase + 2*(waveHeights[0] + waveHeights[1])
	waterSurface = surface_create(room_width, surfaceHeight)
}
else if !surface_exists(waterSurface)
	waterSurface = surface_create(room_width, surfaceHeight)
	
surface_set_target(waterSurface)
draw_clear_alpha(c_black, 0)

if room == GameRoom
	waveColor = oceanColor[? global.seaType]

if global.lighting < 2
	var wave_color = make_color_hsv(colour_get_hue(waveColor), colour_get_saturation(waveColor), (color_get_value(waveColor)+colour_get_value(Clock.skyColor))/2)
else
	var wave_color = waveColor

var foam = merge_color(merge_color(c_white, Clock.skyColor, 0.5+0.3*(global.lighting != 2)), wave_color, max(0, 0.6-0.2*(global.lighting != 2)))
	
var tex = sprite_get_texture(WaveSpr, 0);
var waveDis = texture_get_texel_width(tex)*20*0.8
	

var textureNum = waveOffsets[0]/sprite_get_width(WaveSpr)*wdw;
draw_primitive_begin_texture(pr_trianglestrip, tex);
var height;	
var angle;

// draw wave
draw_set_color(merge_color(wave_color, c_black, 0.5))
for(var r=waveMin; r<=waveMax/wdw; r+=1){
	height[r] = GetWaterLevel(id, r*wdw)
	angle[r] = abs(power(GetWaterAngle(id, r*wdw), 2))/100;
	
	var startTex = (waveDis*textureNum) mod 1.0
	draw_vertex_texture_color(r*wdw, 300, startTex, 1, wave_color, waveAlpha);
	draw_vertex_texture_color(r*wdw, height[r] - (room_height-surfaceHeight), startTex, 0, wave_color, waveAlpha);
	if r < waveMax/wdw
		textureNum ++
}
draw_primitive_end();

// draw foam
draw_primitive_begin(pr_trianglestrip);
for(var r=waveMin; r<=waveMax/wdw; r+=1){
	draw_vertex_color(r*wdw, height[r] - (room_height-surfaceHeight), foam, waveAlpha);
	draw_vertex_color(r*wdw, height[r] - (room_height-surfaceHeight) + angle[r], foam, waveAlpha);
}
draw_primitive_end();

draw_set_color(merge_color(wave_color, c_black, 0.5))
// draw line
for(var r=waveMin; r<waveMax/wdw; r+=1){
	draw_line_width(r*wdw-1, height[r] - (room_height-surfaceHeight)-1, (r+1)*wdw-1, height[r+1] - (room_height-surfaceHeight)-1, 1);
}

surface_reset_target()

DrawWaterSurfaceWithLighting(waterSurface, 0, (room_height-surfaceHeight), 1, 1, c_white, 1, waveLayer)
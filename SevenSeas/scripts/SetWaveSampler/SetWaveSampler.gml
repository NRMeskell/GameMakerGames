// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function SetWaveSampler(){
	MapCreator.disSampler = shader_get_sampler_index( MapWaveShader, "distanceSample");  //yes, with quotes
	MapCreator.sampTexture = sprite_get_texture(MapCreator.distanceBackground, 0);  //sprite_get_texture(), surface_get_texture(), or background_get_texture()
}
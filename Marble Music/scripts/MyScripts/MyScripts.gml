function draw_sprite_outline(sprite_, index_, x_, y_, xscale_, yscale_, rotation_, color_, opac_, outline_, ocolor){
	//Shader Test
	
	if outline_{		
		var uvs = sprite_get_uvs(sprite_, index_);
		var pxw = (uvs[2] - uvs[0]) / sprite_get_width(sprite_)
		var pxh = (uvs[3] - uvs[1]) / sprite_get_height(sprite_)
		
		shader_set(OutlineShader);
		var shd_x_w = shader_get_uniform(OutlineShader, "px_w")
		var shd_x_h = shader_get_uniform(OutlineShader, "px_h")
		
		shader_set_uniform_f(shd_x_w, pxw);
		shader_set_uniform_f(shd_x_h, pxh);
	
		//draw outline
		draw_sprite_ext(sprite_,index_,x_,y_,xscale_,yscale_,rotation_,ocolor,opac_);
		shader_reset();
		
		
	}
	draw_sprite_ext(sprite_,index_,x_,y_,xscale_,yscale_,rotation_,color_,opac_);
}

function getGameBox(){
	return [50, 54, 480, 298]
}

function play_all_sounds(soundList){
	
	var sound;
	for(var i=0; i<ds_list_size(soundList); i++){
		sound = ds_list_find_value(soundList, i)
		audio_play_sound(sound[0], 0, false, sound[1], 0, sound[2])
		
	}
	ds_list_clear(soundList)
	
}

function addSound(soundList, soundID, gain, pitch){
	ds_list_add(soundList, [soundID, gain, pitch])
}
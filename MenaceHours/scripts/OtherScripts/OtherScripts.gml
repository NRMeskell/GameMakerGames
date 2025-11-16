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

function getReachBox(){
	var leftRight = 85
	var up = 15
	return [Player.x - leftRight, Player.y - Player.sprite_height - up, Player.x+leftRight, Player.y + 1]
}

function InReach(){
	var bb = getReachBox()
	return point_in_rectangle(x, y, bb[0], bb[1], bb[2], bb[3])
}
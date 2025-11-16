function HighlightPlatform(platform){
	draw_rectangle(platform.x, platform.y, platform.x+sprite_get_width(platform.sprite_index)*platform.image_xscale, platform.y+sprite_get_height(platform.sprite_index)*platform.image_yscale, true)
}

function DrawTree(rootNode){
	if rootNode == undefined{
		return;
	}
	
	if rootNode.leftNode != undefined{
		draw_line(rootNode.pointX, rootNode.pointY, rootNode.leftNode.pointX, rootNode.leftNode.pointY)
		DrawTree(rootNode.leftNode)
	}
	if rootNode.rightNode != undefined{
		draw_line(rootNode.pointX, rootNode.pointY, rootNode.rightNode.pointX, rootNode.rightNode.pointY)
		DrawTree(rootNode.rightNode)
	}
}

function DrawGraph(platMap){
	var nearSpot;
	for (var k = ds_map_find_first(platMap); !is_undefined(k); k = ds_map_find_next(platMap, k)) {
		var v = platMap[? k];
		/* Use k, v here */
		for(var i=0; i<array_length(v); i++){
			draw_set_color(k.image_blend)
			with v[i]
				nearSpot = NearestSurface(k.x+k.sprite_width/2, 0, false)
			draw_arrow(k.x+k.sprite_width/2, k.y, nearSpot.pointX, v[i].y, 8)
		}
}
}
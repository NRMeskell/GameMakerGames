// Finds nearest available top of platform to point

function FindDesire(desire){
	var possibleList = ds_list_create()
	with TargetParent{
		if desireFilling == desire and visible{
			ds_list_add(possibleList, id)
		}
	}
	if ds_list_size(possibleList) > 0{
		var des1 = ds_list_find_value(possibleList, ds_list_size(possibleList)-1)
		var des2 = ds_list_find_value(possibleList, ds_list_size(possibleList)-1)
		var useDes1 = point_distance(des1.x, des1.y, x, y) < point_distance(des2.x, des2.y, x, y)
		return useDes1 ? des1 : des2;
	}
	else
		return noone
}

function PlatPoint(_x, _y, _platform) constructor {
    pointX = _x;
    pointY = _y;
	platform = _platform;
} 

function NearestSurface(_x, _y, _r){

	var calculate;
	var r;
	var _x1, _y1, _x2, _y2, _x3, _y3, _d;

	var _c = dcos(image_angle);
	var _s = dsin(image_angle);

	_x1 = _x * _c + _y * -_s + ( - x * _c - y * -_s );
	_y1 = _x * _s + _y *  _c + ( - x * _s - y *  _c );

	_x2 = clamp( _x1, sprite_get_width(MooseSittingSpr)/3-sprite_xoffset, sprite_width-sprite_xoffset - sprite_get_width(MooseSittingSpr)/3);
	_y2 = clamp( _y1, -sprite_yoffset, sprite_height-sprite_yoffset);

	_d = point_distance(_x1,_y1,_x2,_y2);

	if _r = false and available
	{
	    calculate = true;
	}
	else
	{
	    if (_d < _r)
	    {
	        calculate = true;
	    }
	    else
	    {
	        calculate = false;
	        return new PlatPoint(-1, -1, noone);
	    }
	}
	if calculate = true
	{
	    _x3 = x + _x2 *  _c + _y2 * _s;
	    _y3 = y + _x2 * -_s + _y2 * _c;
		if _y3 > _y {//and !collision_line(_x, _y, _x3, _y3, Platform, false, true){
			return new PlatPoint(_x3, _y3, id);
		}
	}
	return new PlatPoint(-1, -1, noone);
}

function NearestPlatform(_x, _y){
	var dis = room_width, plat = noone;
	with PlatformParent if available{
		var myPoint = NearestSurface(_x, _y, false);
		if point_distance(_x, _y, myPoint.pointX, myPoint.pointY) < dis {
			dis = point_distance(_x, _y, myPoint.pointX, myPoint.pointY);
			plat = id;
		}
	}
	return plat;
}

function CanJump(plat1, plat2){
	
	var checkPoint1,
		checkPoint2;
	with plat1 
		checkPoint1 = NearestSurface(plat2.x, 0, false)
	with plat2 
		checkPoint2 = NearestSurface(checkPoint1.pointX, -1, false)
		
	if checkPoint1.pointX < 0 or checkPoint2.pointX < 0{
		return false;
	}
	
	return abs(checkPoint1.pointX - checkPoint2.pointX) < 100+20*(plat1.y<plat2.y) and abs(checkPoint1.pointY - checkPoint2.pointY) < 75+25*(plat1.y<plat2.y)
}

function CreateGraph(graph){
	
	// loop through all platforms
	for(var i=0; i<instance_number(PlatformParent); i++){
		var conList = [];
		
		var plat = instance_find(PlatformParent, i);
		// loop through all platforms and look for connections
		for(var j=0; j<instance_number(PlatformParent); j++){
			var conPlat = instance_find(PlatformParent, j);
			
			if i!=j and CanJump(plat, conPlat){
				conList[array_length(conList)] = conPlat;
			}	
		}
	ds_map_add(graph, plat, conList);
	}
}

function GetPath(_sx, _sy, _ex, _ey, platGraph, path){
	
	// set target platforms
	var startPlat = NearestPlatform(_sx, _sy),
	    endPlat = NearestPlatform(_ex, _ey);
		
	// Store best routes for search sake
	var bestMap = ds_map_create()
	
	var platPath = ds_list_create()
	platPath = FindPathRec(platGraph, platPath, startPlat, endPlat, bestMap)[0];
	
	ds_list_clear(path)
	var platPoint, i;
	with ds_list_find_value(platPath, 0)
		platPoint = NearestSurface(_sx, _sy -1, false)
	//ds_list_add(path, platPoint)
	
	for(i=1; i<ds_list_size(platPath)-1; i++){
		with ds_list_find_value(platPath, i){
			platPoint = NearestSurface(platPoint.pointX, 0, false)
		}
		ds_list_add(path, platPoint)
	}
	with ds_list_find_value(platPath, ds_list_size(platPath)-1)
		platPoint = NearestSurface(_ex, _ey -1, false)
	ds_list_add(path, platPoint)
}

function FindPathRec(graph, visitPath, startPlat, endPlat, bestMap){
	
	// create personal path to resturn/pass along
	var myPath = ds_list_create();
	ds_list_copy(myPath, visitPath);
	ds_list_add(myPath, startPlat);
	
	// terminate if a faster route to this paltform has been found
	if ds_map_exists(bestMap, startPlat){
		if ds_map_find_value(bestMap, startPlat) <= ds_list_size(myPath)
			return [myPath, false]
		else
			ds_map_replace(bestMap, startPlat, ds_list_size(myPath))
	}else{
		ds_map_add(bestMap, startPlat, ds_list_size(myPath))
	}
	
	// base case: already in visitPath
	if ds_list_find_index(visitPath, startPlat) != -1{
		return [myPath, false]
	}
	// base case: found desired platform
	if startPlat == endPlat{
		return [myPath, true];
	}else{
		var tempPath = ds_list_create()
		var length = instance_number(PlatformParent)+1
		var edges = graph[? startPlat];
		for(var i=0; i<array_length(edges); i++){
			if edges[i].available{
				var checkPath = FindPathRec(graph, myPath, edges[i], endPlat, bestMap)
				if checkPath[1] == true{
					if ds_list_size(checkPath[0]) < length{
						tempPath = checkPath[0]
						length = ds_list_size(checkPath[0])
					}
				}
			}
		}
		
		if ds_list_size(tempPath) > 0{
			return [tempPath, true]
		}
	}
	// base case 3: this is to catch edge cases
	return [myPath, false]
}


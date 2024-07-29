// @description FindPath(path, startx, stary, endx, endy)
// @params path, startx, starty, endx, endy
function FindPath(path, startx, starty, endx, endy){
	var tempPath = path_add();
	if !mp_grid_path(global.mapGrid, tempPath, startx, starty, endx, endy, true)
		return false
		
	path_set_closed(path, false)
	path_clear_points(path)
	for(var i=0; i<1; i+=2/path_get_length(tempPath)){
		path_add_point(path, path_get_x(tempPath, i), path_get_y(tempPath, i), 100)
	}
	
	var checkStart = 0;
	while checkStart < path_get_number(path)-2{
		var px = path_get_point_x(path, checkStart),
			pxf = path_get_point_x(path, checkStart + 2),
			py = path_get_point_y(path, checkStart),
			pyf = path_get_point_y(path, checkStart + 2)
			
		while !checkGridCollision(px, py, pxf, pyf){
			path_delete_point(path, checkStart+1);
			
			px = path_get_point_x(path, checkStart);
			pxf = path_get_point_x(path, checkStart + 2);
			py = path_get_point_y(path, checkStart);
			pyf = path_get_point_y(path, checkStart + 2);
			
			if checkStart >= path_get_number(path) - 2
				break;
		}
		checkStart ++
	}
	path_add_point(path, endx, endy, 100)
	return true
}

function checkGridCollision(x0, y0, x1, y1){
    var deltax = x1 - x0,
		deltay = y1 - y0,
		deltaerr;
	if (deltax) != 0
		deltaerr = deltay/deltax;
	else
		deltaerr = 10000;

	var error = 0, // No error at star
		gridy = y0 div MapCreator.gridSize,
    for(var gridx = (x0 - MapCreator.mapStart) div MapCreator.gridSize;  gridx != (x1 - MapCreator.mapStart) div MapCreator.gridSize; gridx += sign(deltax)){
        error += abs(deltaerr)
        while abs(error) >= 0.5{
            gridy += sign(deltay)
            error -= 1.0
			if mp_grid_get_cell(global.mapGrid, gridx, gridy) == -1 or mp_grid_get_cell(global.mapGrid, gridx+sign(deltax), gridy) == -1 or mp_grid_get_cell(global.mapGrid, gridx, gridy+sign(deltay)) == -1 
				return true
		}
	}
	return mp_grid_get_cell(global.mapGrid, gridx, gridy) != -1
}

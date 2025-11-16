/// @description Draw List
// You can write your code in this editor

var listX = 20 + camera_get_view_x(view_camera[0]), listY = 20, listDist = sprite_get_height(PlainFontSpr)+1;
var c_done = make_color_rgb(48, 145, 26), c_undone = make_color_rgb(201, 48, 48),
    c_paper = make_color_rgb(250, 242, 220), c_rLine = make_color_rgb(207, 170, 165), c_bLine = make_color_rgb(201, 203, 241);
if tasksOpen{
	// draw paper	
	draw_set_color(c_paper)
	draw_rectangle(listX-10, listY-10, listX+120, 180-listY/2, false)
	
	// draw lines
	draw_set_color(c_bLine)
	for(var i=listY+listDist/2-2; i<180-listY/2; i+=listDist){
		draw_line(listX-10, i, listX+120, i)
	}
	draw_set_color(c_rLine)
	draw_line(listX + 7, listY-10, listX + 7, 180-listY/2)
	
	draw_set_color(c_gray)
	draw_rectangle(listX-9, listY-9, listX+120, 180-listY/2, true)
	
	// draw items
	var listItems=0;
	for (var k = ds_map_find_first(taskState); !is_undefined(k); k = ds_map_find_next(taskState, k)) {
		var v = taskState[? k];
	
		// only run available tasks  
		if v != "missing"{ 
			draw_set_font(global.mainFont)
			draw_set_color(c_dkgray);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_sprite(CheckSpr, (v=="ready" or v=="startable") + 2*(v=="complete"), listX-1, listY+listDist*listItems)
			draw_text(listX + 12, listY+listDist*listItems, k)
			
			var tasks = ds_map_create()
			for(var ap=0; ap<instance_number(ActionParent); ap++){
				with instance_find(ActionParent, ap) if (myTask == k){
					if ds_map_find_value(tasks, taskDesc) == undefined
						tasks[? taskDesc] = readyForTask
					else{
						ds_map_replace(tasks, taskDesc, tasks[? taskDesc] and readyForTask)
					}
				}
			}
			for (var task = ds_map_find_first(tasks); !is_undefined(task); task = ds_map_find_next(tasks, task)) {
				listItems++;
				draw_set_color(c_gray);
				draw_sprite(CheckSpr, 3+tasks[? task], listX+9, listY+listDist*listItems)
				draw_text(listX + 16, listY+listDist*listItems, task)
			}
			ds_map_destroy(tasks)
			listItems++;
		}
	}
}

// Draw start task panel
if currMiniGame == noone{
	for (var k = ds_map_find_first(taskState); !is_undefined(k); k = ds_map_find_next(taskState, k)) {
		var v = taskState[? k];
		draw_set_font(global.mainFont)
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_alpha(0.8)
		var miniGame = find_minigame(k);
		
		
		var tk = k + (miniGame==noone ? "" : " (" + string(miniGame.completeness) + "%)")
		var width = string_width(tk);
		var midX = (320/2 + (23-5)/2) + camera_get_view_x(view_camera[0]), midY = (room_height/2 + 20 + sin(current_time/1000)*2);
		if v == "startable"{			
			draw_sprite_part_ext(StartTaskSpr, 0, 0, 0, 23, sprite_get_height(StartTaskSpr), midX - width/2 - 23, midY, 1, 1, c_white, 0.8) 
			draw_sprite_part_ext(StartTaskSpr, 0, 23, 0, width, sprite_get_height(StartTaskSpr), midX - width/2, midY, 1, 1, c_white, 0.8)
			draw_sprite_part_ext(StartTaskSpr, 0, sprite_get_width(StartTaskSpr) - 5, 0, 5, sprite_get_height(StartTaskSpr), midX+width/2, midY, 1, 1, c_white, 0.8)
	
			draw_text(midX, midY + sprite_get_height(StartTaskSpr)/2, tk)
		}
		draw_set_alpha(1)
	}
}

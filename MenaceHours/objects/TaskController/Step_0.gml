/// @description Handle Tasks
// You can write your code in this editor

var startOne = false
for (var k = ds_map_find_first(taskState); !is_undefined(k); k = ds_map_find_next(taskState, k)) {
	var v = taskState[? k];
  
	// only run available tasks  
	if v != "missing" and v != "complete"{   
		taskState[? k] = "ready" 
		with ActionParent if myTask == k{
			if !readyForTask{
				other.taskState[? k] = "waiting"
			}
			else if other.taskState[? k] == "ready" and InReach() and !startOne{
				other.taskState[? k] = "startable"
			}
		}
		if other.taskState[? k] = "startable"{
			startOne = true
			if v = "startable"{
				startOne = true
				if keyboard_check_pressed(ord("E")) and currMiniGame == noone{
					start_minigame(find_minigame(k))
				}
			}
		}
	}
}

if keyboard_check_pressed(vk_space) and currMiniGame == noone
	tasksOpen = !tasksOpen
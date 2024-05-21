// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function JohnnyScared(){
	UpdateMorale(-1, global.JOLLY)
	UpdateMorale(-1, global.KEEN)
	ds_list_add(global.notificationList, "Johnny Scared!", "Johnny Shortsticks is scared after the recent battle, and is huddled in the corner.")
}

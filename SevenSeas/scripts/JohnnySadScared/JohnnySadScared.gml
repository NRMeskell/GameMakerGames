// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function JohnnySad(){
	ds_list_add(global.notificationList, "Johnny Sad!", "Johnny Shortsticks is upset about the recent " + searchReputationType("repute")[0] + ", and is sitting sadly in the corner.")
}

function JohnnyScared(){
	ds_list_add(global.notificationList, "Johnny Scared!", "Johnny Shortsticks is scared after the recent " + searchReputationType("repute")[0] + ", and is huddled in the corner.")
}

function JohnnyPeekScared(){
	ds_list_add(global.notificationList, "Johnny Shortsticks!", "A shaggy-haired boy peers at the crew, but seems scared to approach any further.")
}
/// @description Mini Game Vars
// You can write your code in this editor

gameName = ""
completeness = 0

// game drawing surface
width = 194; height = 106;
gameSurf = surface_create(width, height)

xc = camera_get_view_width(view_camera[0])/2;
yc = camera_get_view_height(view_camera[0])/2 + 6;

gameMX = 0
gameMY = 0
/// @description Set Up Camera Settings
// You can write your code in this editor


view_wport[0] = display_get_width();
view_hport[0] = display_get_height();
viewRatio = view_wport[0]/view_hport[0]

camera_set_view_size(view_camera[0], (180*viewRatio) div 1, 180)
window_set_rectangle(0, 0, view_wport[0], view_hport[0]);
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))

/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ds_list_add(global.notificationList, "Encouraging Victory!", "The crew celebrate this great victory, overcoming their fears of the undead collector!")

with Pirate{
	UpdateMorale(3, -1)
}
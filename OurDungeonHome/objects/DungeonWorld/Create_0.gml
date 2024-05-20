/// @description Create Dungeon World
// You can write your code in this editor

gridLeft = 0;
gridTop = 0;
global.worldSize = 100;
global.gridSize = 32;

level[0] = mp_grid_create(gridLeft, gridTop, global.worldSize, global.worldSize, global.gridSize, global.gridSize);


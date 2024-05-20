/// @description Monster Order List/Music

/*
Goblin - Basic
Orc - Basic
Ogre - Basic 
Ooze - Arrow
Imp - Fire
Skeleton - 2 Arrow
Spiders - Many, Magic
Troll - Arrow
Ghost - Goes Through Walls

Drake - Fire, Arrow, Magic
Elemental - Full Magic

//Music

Into Darkness on Aroura - Brunahville


/* */
///Monster Idea

/*
Magic Resist - 5
Arrow Resist - 7

--Common Monsters
Goblin <
Orc <
Giant Spiders <
Oger - Nothing <
Troll - Nothing <


--Resist Monster
Giant - Magic and Arrow Resist 
Ooze: 1 Arrow and Weak <
Skeleton: 2 Arrow and 1 Magic < 
Spirit: Full Arrow, Not hit by Walls

--Other Power
Ent - Arrow Resist
Drake - Arrow Resist <
Elemental - Full Magic Resist
Imp - Fire Resist <


/* */
///Set vars

global.TownVictory = false
global.WorkerStage = 0
global.Victory = false
global.Bribed = false
global.BribedDone = false
global.Summoned = false
global.Army = false

PlayerLevel = 0

alarm[0] = room_speed * sqrt(global.LevelSelect) * 40

display_set_gui_size(room_width, room_height);

//Gold
global.Gold = 1500
global.Trees = 12
global.Rocks = 6

/* */
/*  */

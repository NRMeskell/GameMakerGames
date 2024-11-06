/// @description Create Port Types

//TEMP
global.portBuilds = ds_list_create()
ds_list_add(global.portBuilds, Tavern, Smithy, Taylors, ShipYard, TrinketShop)

instantClose = false

///Create Sea Surfaces

mapSizeX = 1752
mapSizeY = 1536
drawX = 0
seaNumber = 7

insideColor = make_color_rgb(165,90,32)
seaColor = merge_color(insideColor, make_color_rgb(38,73,166), 0.5)

landColor = ds_map_create()
landColor[? global.seaNames[0]] = make_color_rgb(95,44,0)
landColor[? global.seaNames[1]] = make_color_rgb(12,60,0)
landColor[? global.seaNames[2]] = make_color_rgb(50,50,50)
landColor[? global.seaNames[3]] = make_color_rgb(60,0,80)
landColor[? global.seaNames[4]] = make_color_rgb(95,10,1)
landColor[? global.seaNames[5]] = make_color_rgb(85,25,1)
landColor[? global.seaNames[6]] = make_color_rgb(0,15,100)

mapStart = 640
x = mapStart
y = 0
image_speed = 0
image_index = 0
seaScroll = 0
seaSurface = surface_create(mapSizeX, mapSizeY)
surface_set_target(seaSurface)
draw_set_color(seaColor)
draw_background_ext(PirateChooseWater, 0, 0, mapSizeX/background_get_width(PirateChooseWater), mapSizeY/background_get_height(PirateChooseWater), 0, c_white, 1)
for(n=0; n<30*9; n++)
    draw_sprite_ext(MapWaveSpr, irandom(3), irandom(mapSizeX), irandom(mapSizeY), 1, 1, 0, c_white, 0.5)
surface_reset_target()

/*seenSurface = surface_create(mapSizeX, mapSizeY)
surface_set_target(seenSurface)
draw_set_color( make_color_rgb(82,45,16))
draw_rectangle(0, 0, mapSizeX, mapSizeY, false)
surface_reset_target()*/

distanceSurface = surface_create(mapSizeX, mapSizeY)
islandSurface = surface_create(mapSizeX, mapSizeY)
surf = surface_create(mapSizeX, mapSizeY)

///Create Islands

restarts = 0
restartLimit = 10000

size = 1
islandNumber = 9

outlineSize = size*1.1
grassSize = size*0.8

islandSize = 230

//Create Sea vars

//Create Placement Vars
seaDis[0] = 0
seaDis[1] = islandSize*2.1
seaDis[2] = islandSize*2.1
seaDis[3] = islandSize*2.3
seaDis[4] = islandSize*2.3
seaDis[5] = islandSize*2.65
seaDis[6] = islandSize*2.65

seaType[0] = ds_list_create()
seaType[1] = ds_list_create()
seaType[2] = ds_list_create()
ds_list_add(seaType[0], global.seaNames[1], global.seaNames[2])
ds_list_add(seaType[1], global.seaNames[3], global.seaNames[4])
ds_list_add(seaType[2], global.seaNames[5], global.seaNames[6])


directions = ds_list_create()
ds_list_add(directions, 0, pi/3, pi*2/3, pi*3/3, pi*4/3, pi*5/3)
dir = ds_list_find_value(directions, irandom(ds_list_size(directions)-1))

//Add Seas
//Add Seas
for(n=0; n<seaNumber; n++)
    {    
    seas[n] = ds_map_create()
    ds_map_add(seas[n], "x", (cos(dir))*seaDis[n])
    ds_map_add(seas[n], "y", (sin(dir))*seaDis[n])
    ds_map_add(seas[n], "dir", dir)
    ds_map_add(seas[n], "conquered", false)
    ds_map_add(seas[n], "enemy seen", false)
    if n = 0
        {
        ds_map_add(seas[n], "type", global.seaNames[0])
        ds_map_add(seas[n], "level", 0)
        }
    else
        {
        pos = 0 //irandom(ds_list_size(seaType[(n-1) div 2])-1)
        ds_map_add(seas[n], "type", ds_list_find_value(seaType[(n-1) div 2], pos))
        ds_map_add(seas[n], "level", (n+1) div 2)
        ds_list_delete(seaType[(n-1) div 2], pos)
        }
     
    islandDirs = ds_list_create()
    for(i=0; i<islandNumber*2; i++)
        {
        ds_list_add(islandDirs, 2*pi*(i/(islandNumber*2)))
        }
    
    i =0
    ///Create Islands
    while(i < islandNumber)
        {            
        flip[n*islandNumber+i] = choose(-size, size)
        spin[n*islandNumber+i] = choose(0, 45, 90, 135, 180, 225, 270, 315)
        islandShape[n*islandNumber+i] = irandom(sprite_get_number(IslandSpr)-1)
        
        myDir = ds_list_find_value(islandDirs, irandom(ds_list_size(islandDirs)-1))
        myDis = (other.islandSize - (3/(islandShape[n*islandNumber+i] div 3 + 3))*sprite_get_height(IslandSpr))
        getIslandX[n*islandNumber+i] = mapSizeX/2 + ds_map_find_value(seas[n], "x") + cos(myDir)*myDis//random_range(-other.islandSize, other.islandSize)
        getIslandY[n*islandNumber+i]  = mapSizeY/2 + ds_map_find_value(seas[n], "y") + sin(myDir)*myDis //random_range(-other.islandSize, other.islandSize)
         
    
        //Check if not too close to more than 2 other islands islands
        makeIsland = true
        closeIslands = 0
        for(r=0; r<n*islandNumber+i; r++)
            {
            if (point_distance(getIslandX[r], getIslandY[r], getIslandY[n*islandNumber+i], getIslandY[n*islandNumber+i]) < 90)
                closeIslands++
            if (point_distance(getIslandX[r], getIslandY[r], getIslandY[n*islandNumber+i], getIslandY[n*islandNumber+i]) < 60)
                closeIslands += 2
            }
                
        if closeIslands > 1
            makeIsland = false
        
            
        makeIsland = true
        //Make island if not too far away
        if makeIsland
            {
            i++
            ds_list_delete(islandDirs, ds_list_find_index(islandDirs, myDir))
            }
            
        restarts ++
        if restarts > restartLimit
            event_user(0)
        }
    if n > 0
        {
        if n/2 != n div 2
            dir += pi
        else
            dir += pi/3
        }
    }
    
for(n=0; n<seaNumber; n++)
    {
    ///Draw black outline
    for(i=0; i<islandNumber; i++)
        {
        newIsland = instance_create(mapStart+getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i], Island)
        with newIsland{
            image_index = other.islandShape[other.n*other.islandNumber+other.i]
            image_speed = 0
            image_xscale = other.flip[other.n*other.islandNumber+other.i] * other.size
            image_yscale = other.size
            image_angle = other.spin[other.n*other.islandNumber+other.i]
			image_blend = ds_map_find_value(other.landColor, ds_map_find_value(other.seas[other.n], "type"))
			}
	}
}

surface_set_target(islandSurface)
with Island{
	draw_sprite_ext(IslandSpr, image_index, x-other.mapStart, y, image_xscale*other.outlineSize, image_yscale*other.outlineSize, image_angle, merge_color(image_blend, other.insideColor, 0), 1)
}
with Island
	draw_sprite_ext(IslandSpr, image_index, x-other.mapStart, y, image_xscale, image_yscale, image_angle, merge_color(image_blend, other.insideColor, 0.6), 1)
with Island
	draw_sprite_ext(IslandSpr, image_index, x-other.mapStart, y, image_xscale*other.grassSize, image_yscale*other.grassSize, image_angle, merge_color(image_blend, other.insideColor, 0.8), 1)
surface_reset_target()


surface_set_target(distanceSurface)
draw_set_color(c_white)
with Island
	for(var si=1; si<1.3; si+=0.03)
		draw_sprite_ext(IslandSpr, image_index, x-other.mapStart, y, image_xscale*other.outlineSize*si, image_yscale*other.outlineSize*si, image_angle, c_black, 0.2)
surface_reset_target()

instance_destroy(Island)

distanceBackground = background_create_from_surface(distanceSurface, 0, 0, surface_get_width(distanceSurface), surface_get_height(distanceSurface), false, false) 
seaBackground = background_create_from_surface(seaSurface, 0, 0, surface_get_width(seaSurface), surface_get_height(seaSurface), false, false)
//seenBackground = background_create_from_surface(seenSurface, 0, 0, surface_get_width(seenSurface), surface_get_height(seenSurface), false, false)
var tempBack = sprite_create_from_surface(islandSurface, 0, 0, surface_get_width(islandSurface), surface_get_height(islandSurface), true, false, 0, 0)
surface_set_target(islandSurface)
var outlineColor = make_color_rgb(5,5,5)
draw_sprite_ext(tempBack, image_index, -1, 0, 1, 1, 0, outlineColor, 1)
draw_sprite_ext(tempBack, image_index, 0, -1, 1, 1, 0, outlineColor, 1)
draw_sprite_ext(tempBack, image_index, 1, 0,  1, 1, 0, outlineColor, 1)
draw_sprite_ext(tempBack, image_index, 0, 1,  1, 1, 0, outlineColor, 1)
draw_sprite_ext(tempBack, image_index, 0, 0,  1, 1, 0, c_white, 1)
surface_reset_target()
sprite_index = sprite_create_from_surface(islandSurface, 0, 0, surface_get_width(islandSurface), surface_get_height(islandSurface), true, false, 0, 0)


surface_free(seaSurface)
surface_free(islandSurface)
surface_free(distanceSurface)

//get distance sampler 
SetWaveSampler()

/// Add to grid
gridSize = 4
global.mapGrid = mp_grid_create(mapStart, 0, mapSizeX div gridSize, mapSizeY div gridSize, gridSize, gridSize)
for(i=0; i<mapSizeX div gridSize; i++){
	for(j=0; j<mapSizeY div gridSize; j++){
		var hitPoints = 0
		if collision_point(mapStart + i*gridSize + gridSize/2, j*gridSize, MapCreator, true, false)
			hitPoints ++
		if collision_point(mapStart + i*gridSize + gridSize/2, j*gridSize + gridSize, MapCreator, true, false)
			hitPoints ++
		if collision_point(mapStart + i*gridSize, j*gridSize + gridSize/2, MapCreator, true, false)
			hitPoints ++
		if collision_point(mapStart + i*gridSize + gridSize, j*gridSize + gridSize/2, MapCreator, true, false)
			hitPoints ++
		
		if hitPoints > 2
			mp_grid_add_cell(global.mapGrid, i, j)
	}
}

//mp_grid_add_instances(global.mapGrid, MapCreator, true)

///Create Landing Spots
spotTypes = ds_map_create()
spotTypes[? global.seaNames[0]] = ds_list_create()
spotTypes[? global.seaNames[1]] = ds_list_create()
spotTypes[? global.seaNames[2]] = ds_list_create()
spotTypes[? global.seaNames[3]] = ds_list_create()
spotTypes[? global.seaNames[4]] = ds_list_create()
spotTypes[? global.seaNames[5]] = ds_list_create()
spotTypes[? global.seaNames[6]] = ds_list_create()

ds_list_add(spotTypes[? global.seaNames[0]], 0,2,3)
ds_list_add(spotTypes[? global.seaNames[1]], 3,4,5)
ds_list_add(spotTypes[? global.seaNames[2]], 2,6,7)
ds_list_add(spotTypes[? global.seaNames[3]], 0,8,9)
ds_list_add(spotTypes[? global.seaNames[4]], 0,2,3)
ds_list_add(spotTypes[? global.seaNames[5]], 0,2,3)
ds_list_add(spotTypes[? global.seaNames[6]], 0,2,3)

landNumber = 11
townNumber = 4
moveSpeed = 30

global.inPort = true

global.path = path_add()

for(n=0; n < seaNumber; n++)
    for(r=0; r<other.landNumber - ds_map_find_value(seas[n], "level"); r++)
        {        
        with instance_create(0, 0, LandingSpot)
            {
            //Set Port Type
            if other.r < other.townNumber - ds_map_find_value(other.seas[other.n], "level")
                {
                image_index = 1
				visible = true
                slotNumber = 3
                myIndex = image_index
                spreadOut = true
                myIslandType = ds_map_find_value(other.seas[other.n], "type")
                }
            else
                {
                sprite_index = UnknownStopSpr
                myIslandType = ds_map_find_value(other.seas[other.n], "type")
                if other.r < 6
                    image_index = ds_list_find_value(other.spotTypes[? myIslandType], other.r mod 3)
                else
                    image_index = ds_list_find_value(other.spotTypes[? myIslandType], irandom(ds_list_size(other.spotTypes[? myIslandType])-1))
                myIndex = image_index
                slotNumber = 1
                spreadOut = false
				visible = false
                }
               
            //Place randomly on map 
            placedWell = false
            rad = 40

            while !placedWell
                {
                myPlaceIsland = irandom(other.islandNumber - 1)
                //myDir = random(2*pi)
                //myDis = other.islandSize*power(random(1), 1/3)
                placeX = other.mapStart + other.getIslandX[other.n*other.islandNumber+myPlaceIsland] + random_range(-25,25) + random_range(-10, 10)
                placeY = other.getIslandY[other.n*other.islandNumber+myPlaceIsland] + random_range(-25,25) + random_range(-10, 10)
                closeLocation = instance_nearest(placeX, placeY, LandingSpot)
                
                placedWell = true
                
                //Dont place near others
                if point_distance(closeLocation.x, closeLocation.y, placeX, placeY) < rad + 60*spreadOut or place_meeting(placeX, placeY, LandingSpot)
                    {
                    placedWell = false
                    if rad > 20
                        rad -= 1
                    }
                    
                /*//Dont place in ocean
                if (mp_grid_get_cell(global.mapGrid, (placeX-other.mapStart) div other.gridSize, placeY div other.gridSize)) != -1
                     placedWell = false*/
                
                //Place near shore
                for(i=0; i<360; i+=2)    
                    {
                    radx = (cos(degtorad(i))*rad/2)
                    rady = (sin(degtorad(i))*rad/2)
                    //dont place too close to water
                    if (mp_grid_get_cell(global.mapGrid, (placeX + radx - other.mapStart) div other.gridSize, (placeY + rady) div other.gridSize)) != -1
                        placedWell = false
                    }
                    
                with MapCreator  
                    {
                    restarts ++
                    if restarts > restartLimit
                        event_user(0)
                    }
                    
                }
                
            //Find nearest water portion
            foundDockLocation = false
            dis = 4
            while foundDockLocation == false
                {
                for(i=0; i<360; i+=4)    
                    {
                    checkX = ((placeX+cos(degtorad(i))*dis) div other.gridSize)*other.gridSize + other.gridSize/2
                    checkY = ((placeY+sin(degtorad(i))*dis) div other.gridSize)*other.gridSize + other.gridSize/2
                    if mp_grid_path(global.mapGrid, global.path, checkX, checkY, other.mapStart+other.gridSize, other.gridSize, true)
                        {
                        foundDockLocation = true
                        with LandingSpot 
                            if (id != other.id) and point_distance(checkX, checkY, other.checkX, other.checkY) < 15
                                other.foundDockLocation = false
                                
                        
                        if foundDockLocation
                            break
                        }
                    }
                dis += 4
                
                with MapCreator  
                    {
                    restarts ++
                        if restarts > restartLimit
                            event_user(0)
                    }
                }    

            x = placeX
            y = placeY
            
            event_user(0)
            
            ///Set starting port and create ship
            if other.n = 0 and other.r = 0
                {
                with instance_create(checkX, checkY, MapShip)
                    {
                    targetPort = instance_nearest(x, y, LandingSpot)
                    global.portType = 1
                    path_position = 1
                    }
                }
            }
        }
    
path_delete(global.path)
    
/* */
///Minimap Vars

buttonHeight = 12
buttonWidth = 26
global.mapPause = false

maxZoom = 2
minZoom = 1
zoom = 1
overMap = false

global.pirateSelected = false
overPause = false
overBoatButton = false
overZoomIn = false
overZoomOut = false

mapClose = true

mouseGrabX = window_view_mouse_get_x(1)
mouseGrabY = window_view_mouse_get_y(1)

windowGrabX = __view_get( e__VW.XView, 1 )
windowGrabY = __view_get( e__VW.YView, 1 )

grabbed = false

onBoat = true
closeSpeed = 15
miniViewX = room_width
miniViewY = 0
miniPortWidth = 250
miniPortHeight = (room_height - 25 - 25)
drawMiniHeight = 0
miniWidth = miniPortWidth
miniHeight = miniPortHeight
miniX = room_width - 15 - miniWidth
miniY = 25

__view_set( e__VW.Visible, 1, true )

__view_set( e__VW.XView, 1, miniViewX )
__view_set( e__VW.YView, 1, miniViewY )
__view_set( e__VW.WView, 1, miniWidth*zoom )
__view_set( e__VW.HView, 1, drawMiniHeight )
__view_set( e__VW.XPort, 1, miniX )
__view_set( e__VW.YPort, 1, miniY )
__view_set( e__VW.WPort, 1, miniPortWidth )
__view_set( e__VW.HPort, 1, drawMiniHeight )

/*__view_set( e__VW.Visible, 0, true )
__view_set( e__VW.XView, 0, 0 )
__view_set( e__VW.YView, 0, 0 )
__view_set( e__VW.HView, 0, room_height )
__view_set( e__VW.WView, 0, room_width )
__view_set( e__VW.XPort, 0, 0 )
__view_set( e__VW.YPort, 0, 0 )
__view_set( e__VW.WPort, 0, room_width )
__view_set( e__VW.HPort, 0, room_height )*/

windowGrabX = __view_get( e__VW.XView, 1 )
windowGrabY = __view_get( e__VW.YView, 1 )

/* */
///ConquerVars
currentSeaNumber = -1

conquerButtonX = miniX - 30
conquerButtonY = miniY + 1
overConquer = false
    
condAmount = 0
condImage = ds_map_create()
condDes = ds_map_create()
condCritera = ds_map_create()

//Cove
ds_map_add(condDes, global.seaNames[0], "Prove your crew's worth beyond a doubt!")
ds_map_add(condCritera, global.seaNames[0], "TRAIN A 4-STAR CREW")
ds_map_add(condImage, global.seaNames[0], 0) 
winCond[0] = 0
 
//tropical islands
ds_map_add(condDes, global.seaNames[1], "Gain the trust of the territorial locals!")
ds_map_add(condCritera, global.seaNames[1], "BEFRIEND THE FROG KING")
ds_map_add(condImage, global.seaNames[1], 1) 
winCond[1] = 0

//rocky shores
ds_map_add(condDes, global.seaNames[2], "Be the first ship to make it through the passage!")
ds_map_add(condCritera, global.seaNames[2], "SAIL THE CRASHING ROCKS")
ds_map_add(condImage, global.seaNames[2], 2) 
winCond[2] = 0

//isles of the dead
ds_map_add(condDes, global.seaNames[3], "lift the curse from the Dead Man's Treasure!")
ds_map_add(condCritera, global.seaNames[3], "COLLECT ALL 5 SOUL STONES")
ds_map_add(condImage, global.seaNames[3], 3) 
winCond[3] = 0

//volcanic
ds_map_add(condDes, global.seaNames[4], "")
ds_map_add(condCritera, global.seaNames[4], "")
ds_map_add(condImage, global.seaNames[4], 4) 
winCond[4] = 0

//sea monsters
ds_map_add(condDes, global.seaNames[5], "")
ds_map_add(condCritera, global.seaNames[5], "")
ds_map_add(condImage, global.seaNames[5], 5) 
winCond[5] = 0

//royal waters
ds_map_add(condDes, global.seaNames[6], "")
ds_map_add(condCritera, global.seaNames[6], "")
ds_map_add(condImage, global.seaNames[6], 6) 
winCond[6] = 0

/* */
///Released seas vars
released = ds_map_create()
ds_map_add(released, global.seaNames[0], true)
ds_map_add(released, global.seaNames[1], true)
ds_map_add(released, global.seaNames[2], true)
ds_map_add(released, global.seaNames[3], true)
ds_map_add(released, global.seaNames[4], false)
ds_map_add(released, global.seaNames[5], false)
ds_map_add(released, global.seaNames[6], false)

event_user(2)

/* */
/*  */

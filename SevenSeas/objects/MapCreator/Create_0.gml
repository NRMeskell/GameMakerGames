/// @description Create Port Types

global.portBuilds = ds_list_create()
ds_list_add(global.portBuilds, Tavern, Smithy, Taylors, ShipYard, TrinketShop)

instantClose = false

///Create Sea Surfaces

seaSizeX = 1752
seaSizeY = 1536
drawX = 0
seaNumber = 7

seaColor = make_color_rgb(38,73,166)
insideColor = make_color_rgb(165,90,32)

landColor = ds_map_create()
landColor[? global.seaNames[0]] = make_color_rgb(95,44,0)
landColor[? global.seaNames[1]] = make_color_rgb(12,60,0)
landColor[? global.seaNames[2]] = make_color_rgb(50,50,50)
landColor[? global.seaNames[3]] = make_color_rgb(60,0,80)
landColor[? global.seaNames[4]] = make_color_rgb(95,10,1)
landColor[? global.seaNames[5]] = make_color_rgb(85,25,1)
landColor[? global.seaNames[6]] = make_color_rgb(0,15,100)

mapStart = 640

seaSurface = surface_create(seaSizeX, seaSizeY)
surface_set_target(seaSurface)
draw_set_color(seaColor)
draw_background_ext(PirateChooseWater, 0, 0, seaSizeX/background_get_width(PirateChooseWater), seaSizeY/background_get_height(PirateChooseWater), 0, c_white, 1)
for(n=0; n<30*9; n++)
    draw_sprite(MapWaveSpr, irandom(3), irandom(seaSizeX), irandom(seaSizeY))
surface_reset_target()

surf = surface_create(seaSizeX, seaSizeY)


/// Add to grid

gridSize = 2
global.mapGrid = mp_grid_create(mapStart, 0, seaSizeX div gridSize, seaSizeY div gridSize, gridSize, gridSize)



///Create Islands



restarts = 0
restartLimit = 10000

size = 1
islandNumber = 12

outlineSize = size*0.9
grassSize = size*0.75

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
        spin[n*islandNumber+i] = irandom(360)
        islandShape[n*islandNumber+i] = irandom(sprite_get_number(IslandSpr)-1)
        
        myDir = ds_list_find_value(islandDirs, irandom(ds_list_size(islandDirs)-1))
        myDis = (other.islandSize - (3/(islandShape[n*islandNumber+i] div 3 + 3))*sprite_get_height(IslandSpr))
        getIslandX[n*islandNumber+i] = seaSizeX/2 + ds_map_find_value(seas[n], "x") + cos(myDir)*myDis//random_range(-other.islandSize, other.islandSize)
        getIslandY[n*islandNumber+i]  = seaSizeY/2 + ds_map_find_value(seas[n], "y") + sin(myDir)*myDis //random_range(-other.islandSize, other.islandSize)
         
    
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
            surface_set_target(seaSurface)
            draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i]-1, getIslandY[n*islandNumber+i], flip[n*islandNumber+i], size*1.2, spin[n*islandNumber+i], merge_color(seaColor, c_black, 8/20), 1)
        
            surface_reset_target()
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
        surface_set_target(seaSurface)
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i]-1, getIslandY[n*islandNumber+i], flip[n*islandNumber+i]*size, size, spin[n*islandNumber+i], c_black, 1)
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i]+1, getIslandY[n*islandNumber+i], flip[n*islandNumber+i]*size, size, spin[n*islandNumber+i], c_black, 1)
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i]+1, flip[n*islandNumber+i]*size, size, spin[n*islandNumber+i], c_black, 1)
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i]-1, flip[n*islandNumber+i]*size, size, spin[n*islandNumber+i], c_black, 1)
        
        newIsland = instance_create(mapStart+getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i], Island)
        with newIsland
            {
            image_index = other.islandShape[other.n*other.islandNumber+other.i]
            image_speed = 0
            image_xscale = other.flip[other.n*other.islandNumber+other.i] * other.size
            image_yscale = other.size
            image_angle = other.spin[other.n*other.islandNumber+other.i]
            }
            
        mp_grid_add_instances(global.mapGrid, newIsland, true)

        instance_destroy(Island)
        
        surface_reset_target()
        }
    }
for(n=0; n<seaNumber; n++)
    {
    for(i=0; i<islandNumber; i++)
        {   
        surface_set_target(seaSurface)
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i], flip[n*islandNumber+i], size, spin[n*islandNumber+i], merge_color(ds_map_find_value(landColor, ds_map_find_value(seas[n], "type")), insideColor, 0), 1)
        surface_reset_target()
        }
    }
for(n=0; n<seaNumber; n++)
    {
    for(i=0; i<islandNumber; i++)
        {
        surface_set_target(seaSurface)    
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i], flip[n*islandNumber+i]*outlineSize, size*outlineSize, spin[n*islandNumber+i], merge_color(ds_map_find_value(landColor, ds_map_find_value(seas[n], "type")), insideColor, 0.6), 1)
        surface_reset_target()
        }
    }
for(n=0; n<seaNumber; n++)
    {
    for(i=0; i<islandNumber; i++)
        {
        surface_set_target(seaSurface)   
        draw_sprite_ext(IslandSpr, islandShape[n*islandNumber+i], getIslandX[n*islandNumber+i], getIslandY[n*islandNumber+i], flip[n*islandNumber+i]*grassSize, size*grassSize, spin[n*islandNumber+i], merge_color(ds_map_find_value(landColor, ds_map_find_value(seas[n], "type")), insideColor, 0.8), 1)
        surface_reset_target()
        }
    }
    
seaBackground = background_create_from_surface(seaSurface, 0, 0, surface_get_width(seaSurface), surface_get_height(seaSurface), false, false)

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
ds_list_add(spotTypes[? global.seaNames[1]], 4,3,5)
ds_list_add(spotTypes[? global.seaNames[2]], 2,6,7)
ds_list_add(spotTypes[? global.seaNames[3]], 0,2,3)
ds_list_add(spotTypes[? global.seaNames[4]], 0,2,3)
ds_list_add(spotTypes[? global.seaNames[5]], 0,2,3)
ds_list_add(spotTypes[? global.seaNames[6]], 0,2,3)

landNumber = 11
townNumber = 3
moveSpeed = 30

global.inPort = true

global.path = path_add()

for(n=0; n < seaNumber; n++)
    for(r=0; r<other.landNumber - ds_map_find_value(seas[n], "level"); r++)
        {        
        with instance_create(0, 0, LandingSpot)
            {
            //Set Port Type
            if other.r < other.townNumber + (other.n == 0)
                {
                image_index = 1
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
                }
               
            //Place randomly on map 
            placedWell = false
            rad = 40

            while !placedWell
                {
                myPlaceIsland = irandom(other.islandNumber - 1)
                //myDir = random(2*pi)
                //myDis = other.islandSize*power(random(1), 1/3)
                placeX = other.mapStart + other.getIslandX[other.n*other.islandNumber+myPlaceIsland] + random_range(-10,10)
                placeY = other.getIslandY[other.n*other.islandNumber+myPlaceIsland] + random_range(-10,10)
                closeLocation = instance_nearest(placeX, placeY, LandingSpot)
                
                placedWell = true
                
                //Dont place near others
                if point_distance(closeLocation.x, closeLocation.y, placeX, placeY) < rad + 60*spreadOut
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

pirateSelected = false
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

__view_set( e__VW.Visible, 0, true )
__view_set( e__VW.XView, 0, 0 )
__view_set( e__VW.YView, 0, 0 )
__view_set( e__VW.HView, 0, room_height )
__view_set( e__VW.WView, 0, room_width )
__view_set( e__VW.XPort, 0, 0 )
__view_set( e__VW.YPort, 0, 0 )
__view_set( e__VW.WPort, 0, room_width )
__view_set( e__VW.HPort, 0, room_height )

windowGrabX = __view_get( e__VW.XView, 1 )
windowGrabY = __view_get( e__VW.YView, 1 )

/* */
///ConquerVars
currentSeaNumber = -1

conquerButtonX = miniX - 30
conquerButtonY = miniY + 1
overConquer = false
    
condAmount = 0
condName = ds_map_create()
condDes = ds_map_create()
condCritera = ds_map_create()

//Cove
ds_map_add(condName, global.seaNames[0], "Expert Crew")
ds_map_add(condDes, global.seaNames[0], "Many ships sail Pirate Cove. To conquer this sea, you need to prove your crew's worth beyond a doubt!")
ds_map_add(condCritera, global.seaNames[0], "Gain a total of four stars on your crew")
winCond[0] = 0
 
//tropical islands
ds_map_add(condName, global.seaNames[1], "Tropical Treasure")
ds_map_add(condDes, global.seaNames[1], "Pearls be a hard treasure to find! Conquer the Tropical Waters by collecting more pearls than any pirate before!")
ds_map_add(condCritera, global.seaNames[1], "Pearls collected: 0/10")
winCond[1] = 0

//rocky shores
ds_map_add(condName, global.seaNames[2], "")
ds_map_add(condDes, global.seaNames[2], "")
ds_map_add(condCritera, global.seaNames[2], "")
winCond[2] = 0

//isles of the dead
ds_map_add(condName, global.seaNames[3], "")
ds_map_add(condDes, global.seaNames[3], "")
ds_map_add(condCritera, global.seaNames[3], "")
winCond[3] = 0

//volcanic
ds_map_add(condName, global.seaNames[4], "")
ds_map_add(condDes, global.seaNames[4], "")
ds_map_add(condCritera, global.seaNames[4], "")
winCond[4] = 0

//sea monsters
ds_map_add(condName,  global.seaNames[5], "")
ds_map_add(condDes, global.seaNames[5], "")
ds_map_add(condCritera, global.seaNames[5], "")
winCond[5] = 0

//royal waters
ds_map_add(condName, global.seaNames[6], "")
ds_map_add(condDes, global.seaNames[6], "")
ds_map_add(condCritera, global.seaNames[6], "")
winCond[6] = 0

/* */
///Released seas vars
released = ds_map_create()
ds_map_add(released, global.seaNames[0], true)
ds_map_add(released, global.seaNames[1], true)
ds_map_add(released, global.seaNames[2], true)
ds_map_add(released, global.seaNames[3], false)
ds_map_add(released, global.seaNames[4], false)
ds_map_add(released, global.seaNames[5], false)
ds_map_add(released, global.seaNames[6], false)

event_user(2)

/* */
/*  */
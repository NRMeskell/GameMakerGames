/// @description Draw back port stuff

animate = Ship.animate
drawPortShiftX = Ship.drawPortShiftX
drawPortShiftY = Ship.drawPortShiftY
portFrontMap = Ship.portFrontMap
drawLayer = 4

//draw everything
if global.inPort = true
    {         
    if global.portType = 0
        {
        DrawWithLighting(DeadTreeSpr, animate, 390+drawPortShiftX, 172+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate + 2, 424+drawPortShiftX, 216+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate, 600+drawPortShiftX, 195+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(SkullRockFront, drawPortShiftX,drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        DrawWithLighting(GrassSpr, animate + 5, 560+drawPortShiftX, 198+drawPortShiftY, 0, c_white, 1, drawLayer)
        }
           
    if global.portType = 1
        {
        if global.seaType == "pirate cove"{
            DrawWithLighting(PalmTree1Spr, animate + 2, 240+drawPortShiftX, 203+drawPortShiftY, 0, c_white, 1, drawLayer)           
            DrawBackWithLighting(portFrontMap[? global.seaType], drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
            }
        if global.seaType == "tropical islands"{
            DrawWithLighting(PalmTree2Spr, animate + 2, 258+drawPortShiftX, 190+drawPortShiftY, 0, c_white, 1, drawLayer)           
            DrawBackWithLighting(portFrontMap[? global.seaType], drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
            DrawWithLighting(SmallPalmSpr, animate + 2, 374+drawPortShiftX, 217+drawPortShiftY, 0, c_white, 1, drawLayer)           
            DrawWithLighting(TallPalm2Spr, animate + 2, 462+drawPortShiftX, 174+drawPortShiftY, 0, c_white, 1, drawLayer)           
            }
        }
        
    if global.portType = 2
        {
        DrawWithLighting(GrassSpr, animate + 2, 276+drawPortShiftX, 215+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(CliffFront, drawPortShiftX, drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        DrawWithLighting(GrassSpr, animate, 604+drawPortShiftX, 172+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate + 7, 578+drawPortShiftX, 898+drawPortShiftY, 0, c_white, 1, drawLayer) 
        DrawWithLighting(VinesSpr, animate + 8, 450+drawPortShiftX, 143+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(VinesSpr, animate + 2, 565+drawPortShiftX, 116+drawPortShiftY, 0, c_white, 1, drawLayer)
        //DrawWithLighting(Vines2Spr, animate, 496+drawPortShiftX, 129+drawPortShiftY, 0, c_white, 1, drawLayer) 
        //DrawWithLighting(Vines2Spr, animate + 4, 578+drawPortShiftX, 198+drawPortShiftY, 0, c_white, 1, drawLayer) 
        }
        
     if global.portType = 3
        {
        DrawWithLighting(PalmTree2Spr, animate + 7, 257+drawPortShiftX, 183+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(PalmTree1Spr, animate, 567+drawPortShiftX, 144+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate + 1, 424+drawPortShiftX, 216+drawPortShiftY, 0, c_white, 1, drawLayer)
        
        DrawBackWithLighting(BeachFront, drawPortShiftX,drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        //DrawWithLighting(PalmTree2Spr, animate + 5, 467+drawPortShiftX, 176+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate, 495+drawPortShiftX, 190+drawPortShiftY, 0, c_white, 1, drawLayer)
        
        DrawWithLighting(GrassSpr, animate + 4, 344+drawPortShiftX, 222+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate, 579+drawPortShiftX, 216+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(CrabSpr, animate, 308+drawPortShiftX, 223+drawPortShiftY, 0, c_white, 1, drawLayer)
        }
    if global.portType = 4
        {
        DrawWithLighting(TallPalm2Spr, animate + 14, 595+drawPortShiftX, 133+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalmSpr, animate + 5, 362+drawPortShiftX, 173+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(BigPalmSpr, animate + 1, 556+drawPortShiftX, 159+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(BigPalmSpr, animate + 3, 515+drawPortShiftX, 195+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(JungleFront, drawPortShiftX ,drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        DrawWithLighting(BigPalmSpr, animate + 9, 416+drawPortShiftX, 179+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 1, 224+drawPortShiftX, 213+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 8, 535+drawPortShiftX, 222+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 7, 334+drawPortShiftX, 198+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 15, 466+drawPortShiftX, 201+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalm2Spr, animate + 2, 590+drawPortShiftX, 163+drawPortShiftY, 0, c_white, 1, drawLayer)
        }   
    if global.portType = 5
        {
        DrawWithLighting(PalmTree2Spr, animate, 565+drawPortShiftX, 158+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(PalmTree2Spr, animate + 10, 410+drawPortShiftX, 188+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower2Spr, animate+13, 419+drawPortShiftX, 238+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(OasisFront, drawPortShiftX ,drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        DrawWithLighting(OasisFlower2Spr, animate+1, 227+drawPortShiftX, 237+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower1Spr, animate+16, 364+drawPortShiftX, 263+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower2Spr, animate+8, 282+drawPortShiftX, 245+drawPortShiftY, 0, c_white, 1, drawLayer)
        } 
    if global.portType = 6
        {
        DrawWithLighting(GrassSpr, animate+5, 367+drawPortShiftX, 234+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate, 456+drawPortShiftX, 216+drawPortShiftY, 0, c_white, 1, drawLayer)
		DrawWithLighting(CrashedShip2Spr, animate, 340+drawPortShiftX, 265+drawPortShiftY, 235 + GetWaterLevel(Ship.middleWaves, 300), c_white, 1, drawLayer)
        DrawBackWithLighting(CrashFront, drawPortShiftX, drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        DrawWithLighting(GrassSpr, animate+2, 411+drawPortShiftX, 242+drawPortShiftY, 0, c_white, 1, drawLayer)
        }
	if global.portType = 7
        {
		DrawWithLighting( TikiHead2Spr, animate, 453, 251, 0, merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        if instance_exists(TikiOffer)
			DrawWithLighting( TikiHead2WaterSpr, TikiOffer.animate, 453, 251, 0, merge_color(c_white, Clock.cloudColor, 0.8), 0.7, drawLayer)
		DrawBackWithLighting(ArchFront, drawPortShiftX, drawPortShiftY,  merge_color(c_white, Clock.cloudColor, 0.5), 1, drawLayer)
        }
    }

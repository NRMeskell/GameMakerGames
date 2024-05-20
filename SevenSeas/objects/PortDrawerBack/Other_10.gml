/// @description Draw back port stuff
animate = Ship.animate
drawPortShiftX = Ship.drawPortShiftX
drawPortShiftY = Ship.drawPortShiftY
drawLayer = 3

//draw everything else
if global.inPort = true {
    if global.portType = 0 {
        DrawWithLighting(SkullRockSpr, animate, 483+drawPortShiftX, 57+drawPortShiftY, 0, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        DrawWithLighting(GrassSpr, animate + 2, 232+drawPortShiftX, 198+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(SkullRockBack, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        DrawWithLighting(DeadTreeSpr, animate + 5, 590+drawPortShiftX, 109+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(WaterfallSpr, animate, 422+drawPortShiftX, 165+drawPortShiftY, 0, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
    }
        
    if global.portType = 1 {
        if global.seaType == global.seaNames[0]{
            DrawWithLighting(CraneSpr, animate, 194+drawPortShiftX, 138+drawPortShiftY, 0, c_white, 1, drawLayer)
            DrawWithLighting(PalmTree1Spr, animate+1, 582+drawPortShiftX, 90+drawPortShiftY, 0, c_white, 1, drawLayer)
            DrawBackWithLighting(Port1Back, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        }
        if global.seaType == global.seaNames[1]{
            DrawWithLighting(TallPalm2Spr, animate, 226+drawPortShiftX, 153+drawPortShiftY, 0, c_white, 1, drawLayer)
            DrawWithLighting(PalmTree1Spr, animate+1, 582+drawPortShiftX, 110+drawPortShiftY, 0, c_white, 1, drawLayer)
            DrawBackWithLighting(Port2Back, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
            DrawWithLighting(BigPalmSpr, animate+1, 384+drawPortShiftX, 153+drawPortShiftY, 0, c_white, 1, drawLayer)
            DrawWithLighting(TallPalmSpr, animate+1, 438+drawPortShiftX, 113+drawPortShiftY, 0, c_white, 1, drawLayer)
            
        }
	}
        
    if global.portType = 2 {
        DrawWithLighting(GrassSpr, animate + 4, 433+drawPortShiftX, 60+drawPortShiftY, 0, c_white, 1, drawLayer)
        //DrawWithLighting(GrassSpr, animate, 562+drawPortShiftX, 30+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(CliffBack, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        DrawWithLighting(VinesSpr, animate, 406+drawPortShiftX, 91+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(VinesSpr, animate + 3, 573+drawPortShiftX, 58+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(Vines2Spr, animate + 8, 490+drawPortShiftX, 63+drawPortShiftY, 0, c_white, 1, drawLayer) 
    }
    if global.portType = 3 {
        DrawWithLighting(PalmTree1Spr, animate + 2, 380+drawPortShiftX, 150+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(PalmTree2Spr, animate, 515+drawPortShiftX, 112+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 3, 461+drawPortShiftX, 139+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 5, 588+drawPortShiftX, 136+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(BeachBack, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
    }
    if global.portType = 4 {
        DrawWithLighting(TallPalmSpr, animate, 389+drawPortShiftX, 114+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalm2Spr, animate+2, 442+drawPortShiftX, 109+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalmSpr, animate+2, 500+drawPortShiftX, 130+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalmSpr, animate+8, 532+drawPortShiftX, 101+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalm2Spr, animate+3, 599+drawPortShiftX, 78+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(BigPalmSpr, animate, 262+drawPortShiftX, 149+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(JungleBack, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        DrawWithLighting(JungleWaterSpr, animate, 437+drawPortShiftX, 158+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(SmallPalmSpr, animate + 5, 389+drawPortShiftX, 158+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(BigPalmSpr, animate+2, 455+drawPortShiftX, 140+drawPortShiftY, 0, c_white, 1, drawLayer)  
        DrawWithLighting(SmallPalmSpr, animate, 200+drawPortShiftX, 182+drawPortShiftY, 0, c_white, 1, drawLayer)
        //DrawWithLighting(SmallPalmSpr, animate + 8, 514+drawPortShiftX, 143+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(BigPalmSpr, animate+8, 583+drawPortShiftX, 113+drawPortShiftY, 0, c_white, 1, drawLayer) 
    }
    if global.portType = 5 {
        DrawWithLighting(TallPalmSpr, animate, 428+drawPortShiftX, 107+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalm2Spr, animate + 3, 218+drawPortShiftX, 140+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(PalmTree2Spr, animate, 371+drawPortShiftX, 138+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(PalmTree2Spr, animate + 5, 545+drawPortShiftX, 110+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(OasisBack, drawPortShiftX, drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        DrawWithLighting(PalmTree1Spr, animate + 5, 236+drawPortShiftX, 179+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(TallPalmSpr, animate + 8, 488+drawPortShiftX, 120+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower1Spr, animate, 290+drawPortShiftX, 230+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower1Spr, animate+5, 268+drawPortShiftX, 218+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower1Spr, animate+12, 377+drawPortShiftX, 215+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower2Spr, animate, 300+drawPortShiftX, 200+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower2Spr, animate+5, 340+drawPortShiftX, 220+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(OasisFlower1Spr, animate+19, 400+drawPortShiftX, 225+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithWaterLighting(OasisWaterSpr, animate/2, 213+drawPortShiftX, 235+drawPortShiftY, 0, merge_color(c_gray, Clock.cloudColor, 0.5), 1, drawLayer)
    }
    if global.portType = 6 {
        DrawWithLighting(GrassSpr, animate+2, 372+drawPortShiftX, 184+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate+4, 451+drawPortShiftX, 191+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(CrashedShip1Spr, animate, 405+drawPortShiftX, 147+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawBackWithLighting(CrashBack, drawPortShiftX,drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        DrawWithLighting(GrassSpr, animate+9, 289+drawPortShiftX, 199+drawPortShiftY, 0, c_white, 1, drawLayer)
        DrawWithLighting(GrassSpr, animate, 541+drawPortShiftX, 171+drawPortShiftY, 0, c_white, 1, drawLayer)
        
		//Draw floating barrels
		DrawWithLighting(DumpedCargo, 0, 383+drawPortShiftX, GetWaterLevel(Ship.middleWaves, 383), 22, c_white, 1, drawLayer)
		DrawWithLighting(DumpedCargo, 1, 275+drawPortShiftX, GetWaterLevel(Ship.middleWaves, 295), -10, c_white, 1, drawLayer)
		DrawWithLighting(DumpedCargo, 0, 250+drawPortShiftX, GetWaterLevel(Ship.middleWaves, 300), 5, c_white, 1, drawLayer)
		DrawWithLighting(DumpedCargo, 1, 338+drawPortShiftX, GetWaterLevel(Ship.middleWaves, 338), -22, c_white, 1, drawLayer)
		DrawWithLighting(DumpedCargo, 1, 305+drawPortShiftX, GetWaterLevel(Ship.middleWaves, 325), 10, c_white, 1, drawLayer)
	}
		
	if global.portType = 7 {
		DrawWithLighting( TikiHead1Spr, animate, 533, 198, 0, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
        if instance_exists(TikiOffer)
			DrawWithLighting( TikiHead1WaterSpr, TikiOffer.animate, 533, 198, 0, merge_color(c_white, Clock.cloudColor, 0.8), 0.7, drawLayer)
		DrawBackWithLighting(ArchBack, drawPortShiftX,drawPortShiftY, merge_color(c_white, Clock.cloudColor, 0.6), 1, drawLayer)
    }
}


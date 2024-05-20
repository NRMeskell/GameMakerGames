/// @description Create 

buttonX = 555
buttonY = 165
buttonXGap = sprite_get_width(StageButtonSpr) + 20
buttonYGap = 105

stageList = ds_list_create()
stageDict = ds_map_create()
picDict = ds_map_create()

ds_map_add(stageDict, BoatGameRoom, "PADDLEBOAT")
ds_map_add(stageDict, FarmGameRoom, "FARMSTEAD")
ds_map_add(stageDict, BlimpGameRoom, "BLIMP RIDE")
ds_map_add(stageDict, FerrisWheelRoom, "FERRIS WHEEL")
ds_map_add(stageDict, CastleGameRoom, "CASTLE SIEGE")
ds_map_add(stageDict, BridgeGameRoom, "DRAWBRIDGE")
ds_map_add(stageDict, FactoryGameRoom, "FACTORY")
ds_map_add(stageDict, SkiLodgeGameRoom, "SKI LODGE")

ds_map_add(picDict, BoatGameRoom, 7)
ds_map_add(picDict, FarmGameRoom, 2)
ds_map_add(picDict, BlimpGameRoom, 3)
ds_map_add(picDict, FerrisWheelRoom, 6)
ds_map_add(picDict, CastleGameRoom, 0)
ds_map_add(picDict, BridgeGameRoom, 1)
ds_map_add(picDict, FactoryGameRoom, 4)
ds_map_add(picDict, SkiLodgeGameRoom, 5)

i = 0;

for(k = ds_map_find_first(stageDict); !is_undefined(k); k = ds_map_find_next(stageDict, k))
    {
    ds_list_add(stageList, k)
    with instance_create(buttonX + (i div 4)*buttonXGap, buttonY + buttonYGap*(i%4), StageButton)
        {
        name = ds_map_find_value(other.stageDict, other.k)
        map = other.k
		picture = ds_map_find_value(other.picDict, other.k)
        }
    i++
    }



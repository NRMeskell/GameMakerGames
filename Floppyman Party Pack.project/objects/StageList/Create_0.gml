/// @description Create 

buttonX = 555
buttonY = 270
buttonXGap = sprite_get_width(StageButtonSpr) + 20
buttonYGap = 60

stageList = ds_list_create()
stageDict = ds_map_create()

ds_map_add(stageDict, BoatGameRoom, "PADDLEBOAT")
ds_map_add(stageDict, FarmGameRoom, "FARMSTEAD")
ds_map_add(stageDict, BlimpGameRoom, "BLIMP RIDE")
ds_map_add(stageDict, FerrisWheelRoom, "FERRIS WHEEL")
ds_map_add(stageDict, CastleGameRoom, "CASTLE SIEGE")
ds_map_add(stageDict, BridgeGameRoom, "DRAWBRIDGE")
ds_map_add(stageDict, FactoryGameRoom, "FACTORY")
ds_map_add(stageDict, SkiLodgeGameRoom, "SKI LODGE")

i = 0;

for(k = ds_map_find_first(stageDict); !is_undefined(k); k = ds_map_find_next(stageDict, k))
    {
    ds_list_add(stageList, k)
    with instance_create(buttonX + (i div 4)*buttonXGap, buttonY + buttonYGap*(i%4), StageButton)
        {
        name = ds_map_find_value(other.stageDict, other.k)
        map = other.k
        }
    i++
    }



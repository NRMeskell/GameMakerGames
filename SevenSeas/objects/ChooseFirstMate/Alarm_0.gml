/// @description Go to game room

if selected
    with ChoosePirateParent
        if !selected
            instance_destroy()

if !instance_exists(LoadingScreenWaves)
    instance_create(0,0,LoadingScreenWaves)


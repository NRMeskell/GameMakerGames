/// @description spawn blades

for(i=0; i<3; i++){
    if !spinBack
        turbine = GolfTurbine  
    else
        turbine = GolfTurbineBack
        
    with instance_create(x,y,turbine){
        phy_rotation = 120*other.i
        }
    }


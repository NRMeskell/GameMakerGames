/// @description Ship Sinking

if instance_exists(CombatRunner) or Ship.myHealth < 1
    Ship.sinking += 200/(room_speed*5)


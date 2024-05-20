/// @description BackgroundStart

global.totalWheelBonus = 1
global.totalSailBonus = 1
global.totalRiggingBonus = 1
global.totalMedicalBonus = 1
global.totalCannonBonus = 1
global.totalSurvivalBonus = 1

global.totalGunBonus = 1
global.totalSwordBonus = 1

drawX = 0
moveSpeed = 0.1

repeat(8)
    {
    instance_create(irandom_range(-100, room_width+100), irandom_range(-100, room_height+100), ChoosePirateShip)
    }


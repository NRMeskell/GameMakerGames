/// @description Create sparkles


sparkleNumber = abs(log2(multiplier))*10
for(i=0; i<sparkleNumber; i++)
    {
    event_user(1)
    sparkleChange[i] = (((sprite_get_number(CombatEffectSpr) - 1)/sparkleNumber) * i) div 1
    }


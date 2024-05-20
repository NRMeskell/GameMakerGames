/// @description flickering


flicker[0] = 3/4
flicker[1] = 5/4
flicker[2] = 7/8
flicker[3] = 4/3
flicker[4] = 4/5
flicker[5] = 8/7

myVolume *= flicker[flickerVal]
flickerVal = (flickerVal + 1) % 6

alarm[1] = irandom(room_speed)


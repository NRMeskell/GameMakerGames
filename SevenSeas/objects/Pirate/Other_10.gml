/// @description Deselect

myShirt.selected = false
myHat.selected = false
myPants.selected = false
myPet.selected = false
myLeftHand.selected = false
myRightHand.selected = false
    
selected = false

if !audio_is_playing(CloseMenuSound)
    audio_play_sound(CloseMenuSound, 1, false)


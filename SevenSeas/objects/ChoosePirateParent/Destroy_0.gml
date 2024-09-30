/// @description Destroy surfaces
// You can write your code in this editor

if surface_exists(fullPirateSurface)
	surface_free(fullPirateSurface)
if surface_exists(smallPirateSurface)
	surface_free(smallPirateSurface)
if surface_exists(tagPirateSurface)
	surface_free(tagPirateSurface)
	
if !selected{
	instance_destroy(myHat)
	instance_destroy(myShirt)
	instance_destroy(myPants)
	instance_destroy(myPet)
	instance_destroy(myRightHand)
	instance_destroy(myLeftHand)
}
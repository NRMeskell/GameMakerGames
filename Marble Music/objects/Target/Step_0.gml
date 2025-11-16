/// @description Find Ball
// You can write your code in this editor


if active{
	var myMarble = instance_nearest(x, y, Marble),
	    currDis = point_distance(myMarble.phy_position_x, myMarble.phy_position_y, x, y);
	
	with myMarble if currDis < (other.targetSize + sprite_get_width(MarbleSpr)/2){
		if other.alarm[0] < other.targetTime - (60*game_get_speed(gamespeed_fps))/SoundController.majorBPM{			
			addSound(other.vol < 0.6 ? SoundController.minorSounds : SoundController.majorSounds, SoundController.insSnds[SoundController.instrument], other.vol, power(2, (SoundController.notes[other.myNote])/12))
		}
		other.alarm[0] = other.targetTime
	}
}
active = true
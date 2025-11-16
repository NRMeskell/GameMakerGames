/// @description Weather vars

if instance_number(Cloud) < cloudNumber
    event_user(1)

if global.weather != 2 and audio_is_playing(myWind){
	audio_stop_sound(StormSnd)
	audio_stop_sound(myWind)
}
if global.weather == 2 and !audio_is_playing(myWind){
	audio_play_sound(StormSnd, 0, true)
	myWind = audio_play_sound(HowlingWindSnd, 0, true)
}
        



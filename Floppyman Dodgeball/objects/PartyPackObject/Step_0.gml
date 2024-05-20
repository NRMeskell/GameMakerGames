/// @description Change size
image_speed = 0

y += sin(current_time/1000)*(0.3-0.2*(room=PartyPackRoom))

if room = TitleRoom{
    image_xscale = sin(min(current_time/1000, pi/2))
    sprite_index = PartyPackText
    }
else{
    image_xscale = 1
    sprite_index = PartyPackSmallSpr
    }
image_yscale = image_xscale


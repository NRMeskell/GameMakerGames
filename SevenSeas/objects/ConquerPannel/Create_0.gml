/// @description vars

x = room_width/2 + 100
y = room_height/2 - 15

scrollSpeed = 12
scrollWidth = 0
conquered = false
animating = false
animationSpeed = 0.2
animation = 0
edgeWidth = 22
swordLength = 17

panelWidth = sprite_get_width(SeaConqueredMapSpr)/2 - edgeWidth
panelHeight = sprite_get_height(SeaConqueredMapSpr)/2 - 5

drawTextY = - panelHeight

audio_play_sound(OpenMapSnd, 1, false)

overScroll = false
open = true

mySeaType = global.seaType
myCurrentSea = MapCreator.currentSeaNumber

with Pirate
    selected = false

depth = -100000

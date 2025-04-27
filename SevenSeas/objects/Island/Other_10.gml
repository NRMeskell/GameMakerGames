/// @description Grow/Shrink
/*
var islandsHit = 0
for(var i=0; i<instance_number(Island); i++)
	if place_meeting(x, y, instance_find(Island, i))
		islandsHit ++

image_xscale = 0.9*sign(image_xscale)
image_xscale = 0.9*sign(image_xscale)

var smallIslandsHit = 0
for(var i=0; i<instance_number(Island); i++)
	if place_meeting(x, y, instance_find(Island, i))
		smallIslandsHit ++
		
image_xscale = 1.1*sign(image_xscale)
image_xscale = 1.1*sign(image_xscale)
		
var bigIslandsHit = 0
for(var i=0; i<instance_number(Island); i++)
	if place_meeting(x, y, instance_find(Island, i))
		bigIslandsHit ++


if bigIslandsHit == smallIslandsHit{
	image_xscale = sign(image_xscale)
	image_yscale = sign(image_xscale)
} else {
	if smallIslandsHit == islandsHit {
		image_xscale = 0.9*sign(image_xscale)
		image_yscale = 0.9*sign(image_xscale)
	}
	else if bigIslandsHit == islandsHit{
		image_xscale = sign(image_xscale)
		image_yscale = sign(image_xscale)
	}
}

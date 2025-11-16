function GammaBalance(r, g, b, v){
	var mag = sqrt(0.299*sqr(r) + 0.587*sqr(g) + 0.114*sqr(b)); 
	var red = r/mag;
	var green = g/mag;
	var blue = b/mag;
	
	
	return [red*v, green*v, blue*v];
}
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float red;
uniform float green;
uniform float blue;

void main(){
	vec3 light, med, dark;
	light = vec3(255.0, 116.0, 179.0)/255.0;
	med = vec3(204.0, 92.0, 143.0)/255.0;
	dark = vec3(153.0, 69.0, 107.0)/255.0;
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (distance(gl_FragColor.rgb, light) < 0.01){
		gl_FragColor.rgb = vec3(red, green, blue);
		return;
	}
	else if (distance(gl_FragColor.rgb, med) < 0.01){
		gl_FragColor.rgb = vec3(red*0.85, green*0.85, blue*0.85);
		return;
	}
	else if (distance(gl_FragColor.rgb, dark) < 0.01){
		gl_FragColor.rgb = vec3(red*0.7, green*0.7, blue*0.7);
		return;
	}
}

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec3 baseTex = texture2D( gm_BaseTexture, v_vTexcoord ).rgb;
	
	if (baseTex.r/2.0 > (baseTex.g + baseTex.b)){
		gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
	}
	else{
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	}
}

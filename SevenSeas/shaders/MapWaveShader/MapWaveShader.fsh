//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//uniform sampler2D distanceSample;

void main()
{
	vec4 a_color = texture2D( gm_BaseTexture, v_vTexcoord );
	if ((distance(a_color.a, v_vColour.a) < 0.1) && (a_color.a != 0.0)){
		
		gl_FragColor = vec4(5, 5, 15, v_vColour.a/3.0 );
	}
	else{
		gl_FragColor = vec4(0.0);
	}
}

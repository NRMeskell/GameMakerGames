//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float uvs[8];
uniform float xSize;
uniform float ySize;

void main()
{
	vec2 pixelSize;
	vec4 testPixel;
	vec3 testColor = vec3(0.0, 0.0, 0.0);
	float alpha = 0.0;
	pixelSize.x = (uvs[2] - uvs[0])/xSize;
	pixelSize.y = (uvs[3] - uvs[1])/ySize;
	
	if ((texture2D( gm_BaseTexture, v_vTexcoord).a > 0.0) && (v_vTexcoord.x > uvs[0] + pixelSize.x) && (v_vTexcoord.x < uvs[2] - pixelSize.x) && (v_vTexcoord.y > uvs[1] + pixelSize.y) && (v_vTexcoord.y < uvs[3] - pixelSize.y)){
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	}
	else{
		alpha = texture2D( gm_BaseTexture, v_vTexcoord).a;
		
		testPixel = texture2D( gm_BaseTexture, vec2(min(v_vTexcoord.x + pixelSize.x, uvs[2]), v_vTexcoord.y));
		if (distance(testPixel.rgb, testColor) > 0.0){
			alpha += testPixel.a;
			gl_FragColor.a = alpha;
			return;
		}
		
		testPixel = texture2D( gm_BaseTexture, vec2(max(uvs[0], v_vTexcoord.x - pixelSize.x), v_vTexcoord.y));
		if (distance(testPixel.rgb, testColor) > 0.0){
			alpha += testPixel.a;
			gl_FragColor.a = alpha;
			return;
		}
		
		testPixel = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, min(v_vTexcoord.y + pixelSize.y, uvs[3])));
		if (distance(testPixel.rgb, testColor) > 0.0){
			alpha += testPixel.a;
			gl_FragColor.a = alpha;
			return;
		}
		
		testPixel = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, max(uvs[1], v_vTexcoord.y - pixelSize.y)));
		if (distance(testPixel.rgb, testColor) > 0.0){
			alpha += testPixel.a;
			gl_FragColor.a = alpha;
			return;
		}
		
		gl_FragColor.a = alpha;
	}
}

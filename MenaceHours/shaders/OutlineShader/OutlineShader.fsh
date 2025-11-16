//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float px_w;
uniform float px_h;

void main()
{
    float alpha = 0.0;
   
    //Add alpha depending on the pixels surround it
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(-px_w, 0.0) ).a; //Left
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(px_w , 0.0) ).a; //Right
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.0, px_h) ).a; //Down
    alpha += texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.0, -px_h) ).a; //Up
   
    //Now draw the results
    gl_FragColor = v_vColour*vec4(1.0,1.0,1.0, alpha);
}

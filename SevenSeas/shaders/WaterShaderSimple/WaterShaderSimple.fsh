//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
    {
    gl_FragColor = vec4(texture2D(gm_BaseTexture, v_vTexcoord).r*(1.0-(v_vTexcoord.y*0.6)), texture2D(gm_BaseTexture, v_vTexcoord).g*(1.0-(v_vTexcoord.y*0.6)), texture2D(gm_BaseTexture, v_vTexcoord).b*(1.0-(v_vTexcoord.y*0.6)), texture2D(gm_BaseTexture, v_vTexcoord).a * v_vColour[3]);
    }


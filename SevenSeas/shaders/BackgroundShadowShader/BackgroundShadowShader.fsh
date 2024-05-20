//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float myX, myY, xSize, ySize, myLayer, pixelW, pixelH;
uniform int lightNumber;

uniform float lightX[10];
uniform float lightY[10];
uniform float red[10];
uniform float green[10];
uniform float blue[10];
uniform float myVolume[10];
uniform float lightLayer[10];

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    /*if ((texture2D( gm_BaseTexture, v_vTexcoord ).a == 1.0)){
        //brightest part
        if ((texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.0, -0.04)).a != 1.0) || (texture2D( gm_BaseTexture, v_vTexcoord + vec2(-0.03, 0.0)).a != 1.0)){
            int i;
            float xDist, yDist, dist, intensity, brightness, xDir, yDir;
            for(i=0; i<10; i+=1){
                if ((lightLayer[i] == myLayer) && (abs((myX + (xSize*v_vTexcoord.x)) - lightX[i]) < 100.0)){
                    float xDist, yDist, dist, intensity, brightness, xDir, yDir;
                    xDist = lightX[i] - (myX + (xSize*v_vTexcoord.x)); //determine x distance
                    yDist = lightY[i] - (myY + (ySize*v_vTexcoord.y)); //determine y distance
                    dist = sqrt( pow(xDist, 2.0) + pow(yDist, 2.0)); //determine total distance to pixel
                    
                    intensity = (red[i] + green[i] + blue[i])/2.0;// / sqrt(3.0);
                    //Determines how bright a pixel should get based on distance and intensity
                    brightness = (((500.0*volume[i])-dist)/(500.0*volume[i]))*intensity;
                
                    gl_FragColor.rgb += vec3(red[i]*brightness, green[i]*brightness, blue[i]*brightness);
                }
            }
        }
    }*/
}    

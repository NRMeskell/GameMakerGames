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
uniform float uvs[8];

void main()
    {
    if ((texture2D( gm_BaseTexture, v_vTexcoord).a != 0.0)){
        int i, myLight;
        float xPos, yPos, dist, org, brightness, lightDis, lb;
        vec3 lightVec;
        
        lb = 35.0;
        lightVec = vec3(0.0, 0.0, 0.0);
        xPos = (v_vTexcoord.x - uvs[0])/(uvs[2] - uvs[0]);
        yPos = (v_vTexcoord.y - uvs[1])/(uvs[3] - uvs[1]);
        
        org = 0.3 - 0.15*pow(yPos + sin(6.28318531*xPos)*0.2, 2.0);
        
        //find brightest light
        for(i=0; i<10; i+=1){
            if (myVolume[i] > 1.0){
                if ((myLayer + 1.0 >= lightLayer[i])){
                    dist = pow(abs(lightX[i] - (myX + (xPos)*xSize)), 1.0); //total distance

                    brightness = (myVolume[i]/8000.0)*max((1600.0 - dist)/(1600.0), 0.0)/(1.0 + yPos);
                    
                    lightVec += vec3(red[i]*brightness, green[i]*brightness, blue[i]*brightness);
                    }
                }
            }
		
            
        gl_FragColor = vec4(floor(lb*texture2D(gm_BaseTexture, v_vTexcoord).r*(org + lightVec.r))/lb, floor(lb*texture2D(gm_BaseTexture, v_vTexcoord).g*(org + lightVec.g))/lb, floor(lb*texture2D(gm_BaseTexture, v_vTexcoord).b*(org + lightVec.b))/lb, texture2D(gm_BaseTexture, v_vTexcoord).a*v_vColour[3]);
		}
    }


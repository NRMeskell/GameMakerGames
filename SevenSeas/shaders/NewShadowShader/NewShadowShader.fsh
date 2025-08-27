varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float myX, myY, xSize, ySize, myLayer, myRot, rotX, rotY;
uniform int lightNumber;

uniform float lightX[10];
uniform float lightY[10];
uniform float red[10];
uniform float green[10];
uniform float blue[10];
uniform float myVolume[10];
uniform float lightLayer[10];
uniform float uvs[8];

float getRotPosX(float xPos, float yPos, float xOffset, float yOffset, float rot){
	return ((xPos - xOffset)*cos(-rot*3.14/180.0) - (yPos - yOffset)*sin(-rot*3.14/180.0)) + xOffset;
}

float getRotPosY(float xPos, float yPos, float xOffset, float yOffset, float rot){
	return ((xPos - xOffset)*sin(-rot*3.14/180.0) + (yPos - yOffset)*cos(-rot*3.14/180.0)) + yOffset;
}

void main()
    {
	vec2 pixelSize, newTexcoord;
	vec4 testPixel;
	vec3 testColor = vec3(0.0, 0.0, 0.0);
	float alpha = 0.0;
	pixelSize.x = (uvs[2] - uvs[0])/xSize;
	pixelSize.y = (uvs[3] - uvs[1])/ySize;
	
	newTexcoord.x = floor(v_vTexcoord.x/pixelSize.x)*pixelSize.x;
	newTexcoord.y = floor(v_vTexcoord.y/pixelSize.y)*pixelSize.y;
	
    if ((texture2D( gm_BaseTexture, v_vTexcoord).a > 0.0) && (v_vTexcoord.x > uvs[0] + pixelSize.x) && (v_vTexcoord.x < uvs[2] - pixelSize.x) && (v_vTexcoord.y > uvs[1] + pixelSize.y) && (v_vTexcoord.y < uvs[3] - pixelSize.y)){
        int i, myLight;
        float xDist, yDist, dist, brightness, j, xPos, yPos;
        vec2 dir;
		vec3 final;
        final = vec3(0.0, 0.0, 0.0);
        
		gl_FragColor = v_vColour * vec4(0.0, 0.0, 0.0, texture2D(gm_BaseTexture, v_vTexcoord).a);
    
        xPos = getRotPosX((newTexcoord.x - uvs[0])/(uvs[2] - uvs[0])*xSize, (newTexcoord.y - uvs[1])/(uvs[3] - uvs[1])*ySize, rotX, rotY, myRot);
        yPos = getRotPosY((newTexcoord.x - uvs[0])/(uvs[2] - uvs[0])*xSize, (newTexcoord.y - uvs[1])/(uvs[3] - uvs[1])*ySize, rotX, rotY, myRot);
		
        //add light if bright
        for(i=0; i<10; i+=1){
			brightness = 0.0;
            if (myVolume[i] > 0.0){
                xDist = lightX[i] - ((myX + uvs[4]) + (xPos)*uvs[6]); //determine x distance
                yDist = lightY[i] - ((myY + uvs[5]) + (yPos)*uvs[7]); //determine y distance
				dist = sqrt(xDist*xDist + yDist*yDist);
                dist += 50.0*abs(myLayer-lightLayer[i]); //total distance
                
				float xdir = 0.7*xDist/(uvs[6]) * (uvs[2] - uvs[0]);
				float ydir = 0.7*yDist/(uvs[7]) * (uvs[3] - uvs[1]);
				
                dir = vec2(xdir*cos(myRot*3.14/180.0)-ydir*sin(myRot*3.14/180.0), xdir*sin(myRot*3.14/180.0)+ydir*cos(myRot*3.14/180.0))/dist;
                brightness = min(2.0, myVolume[i]/(dist*2.0));			
				
                //cast shadows
                if (myLayer > lightLayer[i]){
                    for(j=0.15; j<0.5; j+=0.15){
                        float checkX = (newTexcoord.x + (dir*(j)).x);
                        float checkY = (newTexcoord.y + (dir*(j)).y);
                        
                        //Check if in my texture
                        if ((checkX > uvs[0]) && (checkX < uvs[2]) && (checkY > uvs[1]) && (checkY < uvs[3])){
                            
							
		                    //check if can cast shadow
		                    if (((texture2D(gm_BaseTexture, v_vTexcoord + dir*(pow(j, 2.0))).a > 0.5))){
		                        brightness *= 0.7;
		                    }
							else{
								break;
							}
		                       // }
                           // }
                        }
                    }
                }
				final += vec3(red[i]*brightness, green[i]*brightness, blue[i]*brightness);
            }
        }
		final[0] = min(final[0], 1.0);
		final[1] = min(final[1], 1.0);
		final[2] = min(1.0, final[2]);
		gl_FragColor.rgb = v_vColour.rgb*vec3(texture2D(gm_BaseTexture, v_vTexcoord).r*final[0], texture2D(gm_BaseTexture, v_vTexcoord).g*final[1], texture2D(gm_BaseTexture, v_vTexcoord).b*final[2]);
    }
	else{	
		alpha = v_vColour.a*texture2D( gm_BaseTexture, v_vTexcoord).a;
		
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

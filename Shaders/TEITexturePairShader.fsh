//
//  TEITextureShader.fsh
//  HelloiPadGLSL
//
//  Created by turner on 2/25/10.
//  Copyright Douglass Turner Consulting 2010. All rights reserved.
//
precision highp float;

varying	mediump vec2 v_st;

uniform sampler2D	textureWithAlpha;
uniform sampler2D	heroTexture;

void main() {

	vec4 rgba_0 = texture2D(textureWithAlpha, v_st);	
	vec4 rgba_1 = texture2D(     heroTexture, v_st);	

// My textures have pre-multiplied alpha. Use the Porter/Duff "over" operator
// Use candycane_scalar_disk for texture 0 to see the effect.
	float interpolate = rgba_0.a;
	gl_FragColor.r = rgba_0.r + (1.0 - interpolate) * rgba_1.r;
	gl_FragColor.g = rgba_0.g + (1.0 - interpolate) * rgba_1.g;
	gl_FragColor.b = rgba_0.b + (1.0 - interpolate) * rgba_1.b;
	gl_FragColor.a = rgba_0.a + (1.0 - interpolate) * rgba_1.a;



// Just hacking
//	gl_FragColor.r = rgba_0.r;
//	gl_FragColor.g = rgba_0.g;
//	gl_FragColor.b = rgba_0.b;
//	gl_FragColor.a = 1.0;



// Luminence
//	float lum = 0.30 * rgba_0.r * 0.59 * rgba_0.g + 0.11 * rgba_0.b;
//	gl_FragColor.r = lum;
//	gl_FragColor.g = lum;
//	gl_FragColor.b = lum;
//	gl_FragColor.a = 1.0;
	
	
	
}

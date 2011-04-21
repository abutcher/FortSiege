//
//  FortSiegeWorld.m
//  FortSiege
//
//  Created by Andrew Butcher on 4/16/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//

#import "FortSiegeWorld.h"
#import "CC3Light.h"
#import "CC3Camera.h"
#import "CC3ModelSampleFactory.h"

@implementation FortSiegeWorld

-(void) dealloc {
    [super dealloc];
}

-(void) initializeWorld {
    
	// Create the camera, place it back a bit, and add it to the world
	CC3Camera* cam = [CC3Camera nodeWithName: @"Camera"];
	cam.location = cc3v( 0.0, 0.0, -700.0 );
	[self addChild: cam];
    
	CC3Light* lamp = [CC3Light nodeWithName: @"Lamp"];
	lamp.location = cc3v( 100.0, 100.0, -500.0 );
	lamp.isDirectionalOnly = NO;
	[cam addChild: lamp];
  
    CC3MeshNode* teapotWhite;
	CC3MeshNode* teapotTextured;
	CC3MeshNode* teapotSatellite;
    
    teapotTextured = [[CC3ModelSampleFactory factory] makeLogoTexturedTeapotNamed: kTexturedTeapotName];
	teapotTextured.isTouchEnabled = YES;		// allow this node to be selected by touch events
	
	teapotSatellite = [[CC3ModelSampleFactory factory] makeMultiColoredTeapotNamed: kRainbowTeapotName];
	teapotSatellite.location = cc3v(0.0, 0.0, -2.0);
	teapotSatellite.uniformScale = 0.4;
	teapotSatellite.isTouchEnabled = YES;		// allow this node to be selected by touch events
	
	// Because we want to highlight the satellite and textured teapot separately, we can't make
	// the satellite teapot a child of the textured teapot, otherwise it would get highlighted
	// when the textured teapot was highlighted. So...we create a node that holds onto both
	// teapots and rotates them together, but allows each to be individually highlighted.
	CC3Node* teapotHolder = [CC3Node nodeWithName: kTeapotHolderName];
	teapotHolder.location = cc3v(0.0, 0.0, -650.0);
	teapotHolder.uniformScale = 500.0;
	[teapotHolder addChild: teapotTextured];
	[teapotHolder addChild: teapotSatellite];
	[self addChild: teapotHolder];
    
    // Create OpenGL ES buffers for the vertex arrays to keep things fast and efficient,
	// and to save memory, release the vertex data in main memory because it is now redundant.
	[self createGLBuffers];
	[self releaseRedundantData];
}

@end

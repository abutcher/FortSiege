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
#import "CC3PODMeshModel.h"
#import "CC3PODResourceNode.h"
#import "CC3PODLight.h"

@implementation FortSiegeWorld
static FortSiegeWorld* _mainWorld = nil;

+(FortSiegeWorld*)mainWorld
{    
	@synchronized([FortSiegeWorld class])
	{
 		if (!_mainWorld)
			[[self alloc] init];
        
		return _mainWorld;
	}
	return nil;
}

+(id)alloc
{
	@synchronized([FortSiegeWorld class])
	{    
		NSAssert(_mainWorld == nil, @"Attempted to allocate a second instance of a singleton.");
		_mainWorld = [super alloc];
		return _mainWorld;
	}
        
	return nil;
}

-(void) dealloc {
    [super dealloc];
}

-(void) initializeWorld {
	// Create the camera, place it back a bit, and add it to the world
	cam = [CC3Camera nodeWithName: @"Camera"];
	cam.location = cc3v( 0.0, 0.0, -700.0 );
	[self addChild: cam];
  
	localSelectedLight = [CC3Light nodeWithName: @"selected"];    
    localSelectedLight.location = cc3v(100.0, 100.0, -600.0);
	localSelectedLight.isDirectionalOnly = NO;    
    ccColor4F green = {0.0f, 1.0f, 0.0f, 1.0f};     
    [localSelectedLight setEmissionColor: green];
    localSelectedLight.visible = false;
    
    [[FortSiegeWorld mainWorld] addCamLight: localSelectedLight];
    
    // Create OpenGL ES buffers for the vertex arrays to keep things fast and efficient,
	// and to save memory, release the vertex data in main memory because it is now redundant.
	[self createGLBuffers];
	[self releaseRedundantData];
}

-(void) addMoon {    
    
	CC3MeshNode* teapotTextured;
	CC3MeshNode* teapotSatellite;
    
    teapotTextured = [[CC3ModelSampleFactory factory] makeLogoTexturedTeapotNamed: kTexturedTeapotName];
	teapotTextured.isTouchEnabled = YES;		// allow this node to be selected by touch events
	
	teapotSatellite = [[CC3ModelSampleFactory factory] makeMultiColoredTeapotNamed:kRainbowTeapotName];
    
	teapotSatellite.location = cc3v(0.0, 0.0, -2.0);
	teapotSatellite.uniformScale = 1.0;
	teapotSatellite.isTouchEnabled = YES;		// allow this node to be selected by touch events
	
	// Because we want to highlight the satellite and textured teapot separately, we can't make
	// the satellite teapot a child of the textured teapot, otherwise it would get highlighted
	// when the textured teapot was highlighted. So...we create a node that holds onto both
	// teapots and rotates them together, but allows each to be individually highlighted.
	CC3Node* teapotHolder = [CC3Node nodeWithName: kTeapotHolderName];
	teapotHolder.location = cc3v(-200.0, 50.0, -650.0);
	teapotHolder.uniformScale = 500.0;
	[teapotHolder addChild: teapotTextured];
	[teapotHolder addChild: teapotSatellite];
	[self addChild: teapotHolder]; 

}

- (void) addCamLight:(CC3Light *) inLight {
	[cam addChild: inLight];    
    
}

@end



//
//  FortSiegeWorld.h
//  FortSiege
//
//  Created by Andrew Butcher on 4/16/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CC3World.h"
#import "CC3MeshNode.h"
#import "CC3Light.h"

#define kTexturedTeapotName		@"Teapot"
#define kRainbowTeapotName		@"Satellite"
#define kTeapotHolderName		@"TeapotHolder"
#define kTeapotRedName			@"TeapotRed"
#define kTeapotGreenName		@"TeapotGreen"
#define kTeapotBlueName			@"TeapotBlue"
#define kTeapotWhiteName		@"TeapotWhite"

@interface FortSiegeWorld : CC3World {
    @public
    CC3Camera * cam;
    CC3Light* localSelectedLight;
    
}

+(FortSiegeWorld*)mainWorld;
-(void) addMoon;
-(void) addCamLight: (CC3Light *) inLight;

@property (nonatomic, retain) CC3Camera *cam;
@property (nonatomic, retain) CC3Light *localSelectedLight;

@end

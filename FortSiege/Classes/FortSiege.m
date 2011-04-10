//
//  FortSiege.m
//  FortSiege
//
//  Created by Andrew Butcher on 2/1/11.
//  Copyright West Virginia University 2011. All rights reserved.
//

// Import the interfaces
#import "FortSiege.h"
#import "GameObject.h"

// HelloWorld implementation
@implementation FortSiege

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LevelScene *layer = [LevelScene node];
    
	// add layer as a child to scene
	[scene addChild: layer];
        
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

//
//  LevelScene.m
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "LevelScene.h"


@implementation LevelScene

+(id) scene
{

    CCScene *scene = [CCScene node];
    
    LevelScene *layer = [LevelScene node];
    
    [scene addChild: layer];
    
    return scene;

}

-(id) init
{

    if ( ( self=[super init] )) {
        
        
        
    }
    
    return self;

}

-(void) dealloc
{
    
    [super dealloc];
    
}

@end

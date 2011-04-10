//
//  LevelScene.m
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "LevelScene.h"


@implementation LevelScene

@synthesize tileMap = _tileMap;
@synthesize background = _background;

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

-(id) initWithLevel:(NSString*)FileName
{
    if ( ( self=[super init] )) {
        
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:FileName];
        self.background = [_tileMap layerNamed:@"Background"];
        
        [self addChild:_tileMap z:-1];
    }
    
    return self;
}

-(void) dealloc
{
    self.tileMap = nil;
    self.background = nil;
    [super dealloc];
    
}

@end

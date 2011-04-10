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
@synthesize background2 = _background2;

+(id) scene
{

    CCScene *scene = [CCScene node];
    
    LevelScene *layer = [LevelScene node];
    
    [scene addChild: layer];
    
    return scene;

}

-(id) init
{
    self.isTouchEnabled = YES;

    if ( ( self=[super init] )) {
        
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"map_02.tmx"];
        
        self.background = [_tileMap layerNamed:@"Sky"];
        self.background2 = [_tileMap layerNamed:@"Background"];
        [self addChild:_tileMap z:-1];
        
    }
    
    return self;

}

- (void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(id) initWithLevel:(NSString*)FileName
{
    self.isTouchEnabled = YES;
    
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

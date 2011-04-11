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

    NSLog(@"init levelscene");
    CCScene *scene = [CCScene node];
    
    LevelScene *layer = [LevelScene node];
    UnitMenu *menuLayer = [UnitMenu node];
    
    
    [scene addChild:menuLayer];
    [scene addChild:layer];
    
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
        
        NSLog(@"Map added to scene.");
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];
        CCSpriteBatchNode *sprites = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png"];
		[self addChild:sprites];
        
        NSLog(@"Sprite sheet loaded.");
        
        /*
        CCSprite *knight = [CCSprite spriteWithSpriteFrameName:@"knight_stand_01.png"];
        knight.position = ccp(1024/2, 768/3+40);
        [sprites addChild:knight];
        */
        DynamicGameObject *object_1 = [[DynamicGameObject alloc] initWithObjectType:knight];
        NSLog(@"object 1 is: %i",object_1.objectType);
        [gameObjects addObject:object_1];
        
        for (DynamicGameObject *object in gameObjects) {
            NSLog(@"Checking loop");
            NSLog(@"%i", object.objectType);
        }    
        
        NSLog(@"Adding demo guys to scene.");
     
        // add update callback loop
        
        [object_1 dealloc];
    }
    
    return self;

}

- (NSMutableArray *) gameObjects {
    return gameObjects;
}

- (void) setGameObjects:(NSMutableArray *) newGameObjects {
    [newGameObjects retain];
    [gameObjects release];
    gameObjects = newGameObjects;
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

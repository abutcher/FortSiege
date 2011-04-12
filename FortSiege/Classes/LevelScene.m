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
    [scene addChild:layer];
    
    UnitMenu *menuLayer = [UnitMenu node];
    menuLayer.scale = 2.75;
    menuLayer.position = ccp(720,680);
    
    [scene addChild:menuLayer];
    
    return scene;

}

-(id) init
{
    self.isTouchEnabled = YES;
    
    // Must be reset at the beginning of each level.
    GameObjectTag = 0;

    if ( ( self=[super init] )) {
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"revecy.mp3" loop:YES];
        
        self.gameObjects = [NSMutableArray array];
        
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"map_02.tmx"];
        self.background = [_tileMap layerNamed:@"Sky"];
        self.background2 = [_tileMap layerNamed:@"Background"];
        [self addChild:_tileMap z:-1];
        
        NSLog(@"Map added to scene.");
        
        // Moved to FortSiegeAppDelegate.m
        // [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];
        
        CCSpriteBatchNode *sprites = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png"];
		[self addChild:sprites z:1];
        
        NSLog(@"Sprite sheet loaded.");
        
        /*
        CCSprite *knight = [CCSprite spriteWithSpriteFrameName:@"knight_stand_01.png"];
        knight.position = ccp(1024/2, 768/3+40);
        [sprites addChild:knight];
        */
 
        for (int i = 0; i < 1; i++) {
            Knight* tmp = [[Knight alloc] init];
            tmp.position.x = 768;
            tmp.position.y = 298;
            tmp.character.position = ccp(768+i*20,296);
            [gameObjects addObject:tmp];
            tmp.state = WALKING;
            tmp.facing = LEFT;
            [tmp runWalkAction];
            [sprites addChild:tmp.character];
        }

        for (GameObject *object in gameObjects) {
            // Move this into dynamic object somehow
            
            NSLog(@"%s",object_getClassName(object));
            
/*            if ( object.objectType == knight) {
                CCSprite *temp = [CCSprite spriteWithSpriteFrameName:@"knight_stand_01.png"];
                // set position
                // add temp
            }*/
        }    
        
        NSLog(@"Adding demo guys to scene.");
     
        [self schedule:@selector(nextFrame:)];
    }
    
    return self;

}

- (void) nextFrame:(ccTime)dt {
	for (GameObject *object in self.gameObjects) {
        [object updateObject: dt];
    }
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

//
//  LevelScene.m
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "LevelScene.h"

@implementation LevelScene
static LevelScene* _mainLevelScene = nil;

@synthesize tileMap = _tileMap;
@synthesize background = _background;
@synthesize background2 = _background2;
@synthesize sprites = _sprites;
@synthesize gameObjects = _gameObjects;


+(LevelScene*)mainLevelScene
{
	@synchronized([LevelScene class])
	{
		if (!_mainLevelScene)
			[[self alloc] init];
        
		return _mainLevelScene;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([LevelScene class])
	{
		NSAssert(_mainLevelScene == nil, @"Attempted to allocate a second instance of a singleton.");
		_mainLevelScene = [super alloc];
		return _mainLevelScene;
	}
    
	return nil;
}

//HERPIN DERPS

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
        
        self.sprites = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png"];
		[self addChild:self.sprites z:1];
        
        NSLog(@"Sprite sheet loaded.");
        
        // Stream-lined demo guy addition.
        [self addGameObject:[[Knight alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
        
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

- (void) addGameObject:(GameObject *)object {
    [self.gameObjects addObject:object];
    [self.sprites addChild:object.character];
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

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
@synthesize sprites = _sprites;
@synthesize gameObjects = _gameObjects;



+(id) scene
{

    NSLog(@"init levelscene");
    CCScene *scene = [CCScene node];
    
    LevelScene *layer = [LevelScene node];
    [scene addChild:layer];
    
    return scene;

}

-(id) init
{
    if ( ( self=[super init] )) {
        
        self.isTouchEnabled = YES;
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"revecy.mp3" loop:YES];
        
        self.gameObjects = [NSMutableArray array];
        
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"map_02.tmx"];
        self.background = [_tileMap layerNamed:@"Sky"];
        self.background2 = [_tileMap layerNamed:@"Background"];
        [self addChild:_tileMap z:-1];
        
        NSLog(@"Map added to scene.");
        
        self.sprites = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png"];
		[self addChild:self.sprites z:1];
        
        NSLog(@"Sprite sheet loaded.");

        [self schedule:@selector(nextFrame:)];
        
        UnitMenu *menuLayer = [UnitMenu node];
        menuLayer.scale = 2.75;
        menuLayer.position = ccp(720,680);
        
        [self addChild:menuLayer];        
        menuLayer.parent = self;

    }
    
    return self;

}

- (void) nextFrame:(ccTime)dt {
	for (GameObject *object in self.gameObjects) {
        [object updateObject: dt];
    }
}

// Should check this CGPoint struct out further I think...
-(CGPoint)tileCoordinateGivenCGPoint:(CGPoint)position {
    int x = position.x / self.tileMap.tileSize.width;
    int y = ((self.tileMap.mapSize.height * self.tileMap.tileSize.height) -position.y);
    return ccp(x,y);
}

// Second tile coordinate function in case we only keep x and y int's.
-(CGPoint) tileCoordinateGivenX:(int)X andY:(int)Y {
    int x = X / self.tileMap.tileSize.width;
    int y = ((self.tileMap.mapSize.height * self.tileMap.tileSize.height) - Y);
    return ccp(x,y);
}

- (void) addGameObject:(GameObject *)object {
    [self.gameObjects addObject:object];
    [self.sprites addChild:object.character];
}

-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    CGRect selectionRectangle = CGRectMake(location.x, location.y, 60, 60);
    
    for (GameObject *object in self.gameObjects) {
        if (CGRectContainsPoint(selectionRectangle, object.character.position)) {
            NSLog(@"Selected: %@", [object class]);
        }
    }
    
    NSLog(@"X: %.2f, Y: %.2f", location.x, location.y);
}

-(id) initWithLevel:(NSString*)FileName
{
    
    if ( ( self=[super init] )) {
        
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:FileName];
        self.background = [_tileMap layerNamed:@"Background"];
        
        [self addChild:_tileMap z:-1];
        
        self.isTouchEnabled = YES;
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

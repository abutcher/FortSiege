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

static LevelScene* _mainLevelScene = nil;

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
		NSAssert(_mainLevelScene == nil, @"Attempted to allocate a second instance of a singleton (LevelScene).");
		_mainLevelScene = [super alloc];
		return _mainLevelScene;
	}
    
	return nil;
}

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
	self = [super init];

	if (self != nil) {        
        // Must be reset at the beginning of each level.        
        GameObjectTag = 0;
        
        self.isTouchEnabled = YES;
        
        
        self.cc3World = [FortSiegeWorld mainWorld];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"revecy.mp3" loop:YES];
        
        self.gameObjects = [NSMutableArray array];
        
        self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"map_02.tmx"];
        self.background = [_tileMap layerNamed:@"Sky"];
        self.background2 = [_tileMap layerNamed:@"Background"];
        [self addChild:_tileMap z:-1];
        
        NSLog(@"Map added to scene. Orientation: %d, Position: (%f, %f)", self.tileMap.mapOrientation, self.tileMap.position.x, self.tileMap.position.y);
        
        self.sprites = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png"];
		[self addChild:self.sprites z:1];
        
        NSLog(@"Sprite sheet loaded.");
        
        [self schedule:@selector(nextFrame:)];
        
        UnitMenu *menuLayer = [UnitMenu node];
        menuLayer.scale = 2.75;
        menuLayer.position = ccp(720,680);
        
        [self addChild:menuLayer];        
        menuLayer.parent = self;
        
        //MANUAL FIRE LIGHTS - PROBABLY REMOVE ME LATER
        
        [self addChild:[[SmallFire alloc] initWithPosition:ccp(845, 305)] z:0 tag:99];
        [self addChild:[[SmallSmoke alloc] initWithPosition:ccp(845, 310)] z: -1 tag:99];
        [self addChild:[[SmallFire alloc] initWithPosition:ccp(135, 305)] z:0 tag:99];
        [self addChild:[[SmallSmoke alloc] initWithPosition:ccp(135, 310)] z: -1 tag:99];

        [self addChild:[[SmallFire alloc] initWithPosition:ccp(545, 305)] z:0 tag:99];
        [self addChild:[[SmallSmoke alloc] initWithPosition:ccp(545, 310)] z: -1 tag:99];
        [self addChild:[[SmallFire alloc] initWithPosition:ccp(335, 305)] z:0 tag:99];
        [self addChild:[[SmallSmoke alloc] initWithPosition:ccp(335, 310)] z: -1 tag:99];        
        CC3Light* fireLight1 = [CC3Light nodeWithName: @"fire1"];
        CC3Light* fireLight2 = [CC3Light nodeWithName: @"fire2"];
        CC3Light* fireLight3 = [CC3Light nodeWithName: @"fire3"];
        CC3Light* fireLight4 = [CC3Light nodeWithName: @"fire4"];
        
        fireLight1.location = cc3v(845, 305, -500.0);
        fireLight2.location = cc3v(545, 305, -500.0);
        fireLight3.location = cc3v(345, 305, -500.0);
        fireLight4.location = cc3v(145, 305, -500.0);
                
        fireLight1.isDirectionalOnly = NO;        
        fireLight2.isDirectionalOnly = NO;        
        fireLight3.isDirectionalOnly = NO;        
        fireLight4.isDirectionalOnly = NO;                
        
        
        [[FortSiegeWorld mainWorld]->cam addChild: fireLight1];
        [[FortSiegeWorld mainWorld]->cam addChild: fireLight2];
        [[FortSiegeWorld mainWorld]->cam addChild: fireLight3];
        [[FortSiegeWorld mainWorld]->cam addChild: fireLight4];
        
        //end dumb manual fire lights
        
        [[FortSiegeWorld mainWorld] addMoon];
                
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
    [self.sprites addChild:object.selectRect];    
    
}

-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event 
{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    CGPoint prevLocation = [touch previousLocationInView:[touch view]];
    
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    prevLocation = [[CCDirector sharedDirector] convertToGL:prevLocation];
    prevLocation.y = touchLocation.y;
    
    CGPoint diff = ccpSub(touchLocation, prevLocation);
    
    // Move the map itself.
    [self.tileMap setPosition:ccpAdd([self.tileMap position], diff)];
    
    // Move characters.
    for (GameObject *object in self.gameObjects) {
        [object.selectRect setPosition:ccpAdd([object.character position], diff)];        
        [object.character setPosition:ccpAdd([object.character position], diff)];        
    }
    
    // Move scene objects with tag value 99, such as torch flames.
    for (CCNode *node in self.children) {
        if ([node tag] == 99) {
            [node setPosition:ccpAdd([node position], diff)];
            //[(CCParticleSystem*)node setSourcePosition:ccpAdd([(CCParticleSystem*)node sourcePosition], diff)];
        }
    }
    
    // Revert any changes that would move map/characters off screen.
    if (self.tileMap.position.x > 0) {
        [self.tileMap setPosition:ccp(0, self.tileMap.position.y)];
        for (GameObject *object in self.gameObjects) {
            [object.selectRect setPosition:ccpSub([object.character position], diff)];            
            [object.character setPosition:ccpSub([object.character position], diff)];            
        }
        for (CCNode *node in self.children) {
            if ([node tag] == 99) {
                [node setPosition:ccpSub([node position], diff)];
                //[(CCParticleSystem*)node setSourcePosition:ccpSub([(CCParticleSystem*)node sourcePosition], diff)];

            }
        }        
    } 
    
    if (self.tileMap.position.x < -515) {
        [self.tileMap setPosition:ccp(-515, self.tileMap.position.y)];
        for (GameObject *object in self.gameObjects) {
            [object.selectRect setPosition:ccpSub([object.character position], diff)];            
            [object.character setPosition:ccpSub([object.character position], diff)];
            
        }        
        for (CCNode *node in self.children) {
            if ([node tag] == 99) {
                [node setPosition:ccpSub([node position], diff)];
                //[(CCParticleSystem*)node setSourcePosition:ccpSub([(CCParticleSystem*)node sourcePosition], diff)];
            }
        }
    }
     
    NSLog(@"tileMap moved to (%.1f, %.1f)", self.tileMap.position.x, self.tileMap.position.y);
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    CGRect selectionRectangle = CGRectMake(location.x-40, location.y, 40, 40);

    for (GameObject *object in self.gameObjects) {
        if (object.selectedP)
        {
            [object unselected];
            [self.sprites removeChild:object.selectRect cleanup:TRUE];                    
        }
    }
    
    for (GameObject *object in self.gameObjects) {
        if (CGRectContainsPoint(selectionRectangle, object.character.position)) {
            NSLog(@"Selected: %@", [object class]);
            [object selected];
            [self.sprites addChild:object.selectRect];              
        }
        if (object != NULL && object.selectedP) break;
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

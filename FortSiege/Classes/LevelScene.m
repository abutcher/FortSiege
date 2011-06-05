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
    // Must be reset at the beginning of each level.
    GameObjectTag = 0;

    if ( ( self=[super init] )) {
        
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

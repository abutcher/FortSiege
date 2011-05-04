//
//  LevelScene.h
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCTouchDispatcher.h"
#import "UnitMenu.h"
#import "GameObject.h"
#import "SimpleAudioEngine.h"

#import "Knight.h"
#import "KingArthur.h"
#import "Barrelman.h"
#import "Soldier.h"
#import "Archer.h"

#import "CC3Layer.h"
#import "CC3Light.h"
#import "FortSiegeWorld.h"

#import "SmallFire.h"
#import "SmallSmoke.h"



extern int GameObjectTag;


@interface LevelScene : CC3Layer {
    
    LevelScene *LS;
    
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
    CCTMXLayer *_background2;
    NSMutableArray *_gameObjects;
    CCSpriteBatchNode *_sprites;
        
}

+(LevelScene*)mainLevelScene;

+ (id) scene;
- (void) addGameObject: (GameObject *) object;

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;
@property (nonatomic, retain) CCTMXLayer *background2;
@property (nonatomic, retain) NSMutableArray *gameObjects;
@property (nonatomic, retain) CCSpriteBatchNode *sprites;

@end

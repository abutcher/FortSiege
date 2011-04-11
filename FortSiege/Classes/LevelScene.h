//
//  LevelScene.h
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UnitMenu.h"
#import "GameObject.h"

#import "Knight.h"
#import "KingArthur.h"
#import "Barrelman.h"
#import "Soldier.h"
#import "Archer.h"

@interface LevelScene : CCLayer {
    
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
    CCTMXLayer *_background2;
    NSMutableArray *gameObjects;
    
}

+ (id) scene;
- (NSMutableArray *) gameObjects;
- (void) setGameObjects: (NSMutableArray *) gameObjects;

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;
@property (nonatomic, retain) CCTMXLayer *background2;

@end

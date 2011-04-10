//
//  LevelScene.h
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelScene : CCLayer {
    
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
    
}

+ (id) scene;

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;

@end

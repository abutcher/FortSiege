//
//  UnitMenu.h
//  FortSiege
//
//  Created by Daniel Sloan on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCTouchDispatcher.h"
#import "UnitMenu.h"
#import "GameObject.h"

#import "Knight.h"
#import "KingArthur.h"
#import "Barrelman.h"
#import "Soldier.h"
#import "Archer.h"

#import "MainMenuScene.h"

#import "CC3Layer.h"
#import "CC3Light.h"

@class LevelScene;

@interface UnitMenu : CC3Layer
{
    LevelScene* parent;
    
    CCLabelTTF *_label;
    CCSprite *bigMenu;
    
    CCSprite *normal1;
    CCSprite *normal2;
    CCSprite *normal3;
    CCSprite *normal4;
    CCSprite *normal5;
    CCSprite *normal6;
    CCSprite *normal7;
    
    CCSprite *selected1;    
    CCSprite *selected2;    
    CCSprite *selected3;    
    CCSprite *selected4;    
    CCSprite *selected5;    
    CCSprite *selected6;    
    CCSprite *selected7;    
    
    CCMenuItemSprite *menuItem1;
    CCMenuItemSprite *menuItem2;
    CCMenuItemSprite *menuItem3;
    CCMenuItemSprite *menuItem4;
    CCMenuItemSprite *menuItem5;
    CCMenuItemSprite *menuItem6;
    CCMenuItemSprite *menuItem7;
    
}

//- (void) addGameObject: (GameObject *) object;
@property (retain) LevelScene* parent;

@end
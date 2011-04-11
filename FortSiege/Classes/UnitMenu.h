//
//  UnitMenu.h
//  FortSiege
//
//  Created by Daniel Sloan on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@interface UnitMenu : CCLayer
{
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

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
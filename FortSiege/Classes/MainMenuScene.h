//
//  MainMenuScene.h
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "cocos2d.h"
#import <Foundation/Foundation.h>
#import "AboutUsScene.h"
#import "LevelScene.h"
#import "SimpleAudioEngine.h"

@interface MainMenuScene : CCLayer {
    
    CCLabelTTF *_title;
}

+(id) scene;

@end

//
//  GameObject.h
//  FortSiege
//
//  Created by Kel Cecil on 4/4/11.
//  Copyright 2011 WVU. All rights reserved.
//
//  Not using @synthesize to reinforce the syntax of the new language.
//
#import "cocos2d.h"
#import <Foundation/Foundation.h>

enum State {
    ATTACKING = 0,
    STANDING = 1,
    WALKING = 2
    };

enum Facing {
    RIGHT = 0,
    LEFT = 0
};

@interface Position : NSObject {
@private
    int x;
    int y;
}

@property int x;
@property int y;

-(Position*) init;
-(Position*) initWithCoordinatesX:(int)X andY:(int)Y;

@end

@interface Velocity : NSObject {
@private
    int deltaX;
    int deltaY;
}

@property int deltaX;
@property int deltaY;

-(Velocity*) initWithVelocityX:(int)inputDeltaX andY:(int)inputDeltaY;
-(Velocity*) init;
@end

static int GameObjectTag;

@interface GameObject : NSObject {
@private
    Position* position;
    Velocity* velocity;
    int tag;
    enum State state;
    enum Facing facing;
    CCSprite* _character;
}

@property enum State state;
@property enum Facing facing;
@property (retain) CCSprite* character;
@property (retain) Position* position;
@property (retain) Velocity* velocity;
@property int tag;

-(void) update;
-(void) runWalkAction;
-(void) runAttackAction;
-(void) runStandAction;

@end


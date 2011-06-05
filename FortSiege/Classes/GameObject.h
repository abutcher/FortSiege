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

#import "CC3Layer.h"
#import "CC3Light.h"
#import "FortSiegeWorld.h"

#import "GameObject.h"


extern enum State {
    ATTACKING = 0,
    STANDING = 1,
    WALKING = 2
    };

extern enum Facing {
    RIGHT = 0,
    LEFT = 1
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
    CCAnimation* _walkAnimation;
    CCAnimation* _standAnimation;
    CCAnimation* _attackAnimation;
    
    CCAction* _walkAction;
    CCAction* _standAction;
    CCAction* _attackAction;        
    
    CCSprite* _selectRect;
    
    BOOL selectedP;
    
    BOOL collideable;
    int maxHitPoints;
    int maxManaPoints;
    int currHitPoints;
    int currManaPoints;    
    int attackDamage;
    
    
}

@property enum State state;
@property enum Facing facing;
@property (retain) CCSprite* selectRect;
@property (retain) CCSprite* character;
@property (retain) Position* position;
@property (retain) Velocity* velocity;
@property (retain) CCAnimation* walkAnimation;
@property (retain) CCAnimation* standAnimation;
@property (retain) CCAnimation* attackAnimation;

@property (retain) CCAction* walkAction;
@property (retain) CCAction* standAction;
@property (retain) CCAction* attackAction;

@property BOOL selectedP;

@property BOOL collideable;
@property int maxHitPoints;
@property int maxManaPoints;
@property int currHitPoints;
@property int currManaPoints;
@property int attackDamage;


@property int tag;

-(void) selected;
-(void) unselected;

-(void) updateObject:(ccTime) dt;
-(void) runWalkAction;
-(void) runAttackAction;
-(void) runStandAction;


@end


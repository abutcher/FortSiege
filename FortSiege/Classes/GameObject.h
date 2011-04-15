//
//  GameObject.h
//  FortSiege
//
//  Created by Kel Cecil on 4/4/11.
//  Copyright 2011 WVU. All rights reserved.
//
//
#import "cocos2d.h"
#import <Foundation/Foundation.h>
/*
extern enum State {
    ATTACKING = 0,
    STANDING = 1,
    WALKING = 2
    };
*/

typedef enum {
    ATTACKING,
    STANDING,
    WALKING
} State ;

/*
extern enum Facing {
    RIGHT = 0,
    LEFT = 1
};
 */
typedef enum {
    RIGHT,
    LEFT
} Facing ;

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

@interface GameObject : NSObject {
@private
    Position* position;
    Velocity* velocity;
    State state;
    Facing facing;
    CCSprite* _character;
    CCAnimation* _walkAnimation;
    CCAnimation* _standAnimation;
    CCAnimation* _attackAnimation;
    CCAction* _walkAction;
    CCAction* _standAction;
    CCAction* _attackAction;    
}

@property State state;
@property Facing facing;
@property (retain) CCSprite* character;
@property (retain) Position* position;
@property (retain) Velocity* velocity;
@property (retain) CCAnimation* walkAnimation;
@property (retain) CCAnimation* standAnimation;
@property (retain) CCAnimation* attackAnimation;
@property (retain) CCAction* walkAction;
@property (retain) CCAction* standAction;
@property (retain) CCAction* attackAction;

-(void) updateObject:(ccTime) dt;
-(void) runWalkAction;
-(void) runAttackAction;
-(void) runStandAction;


@end


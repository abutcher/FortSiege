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
    int tag;
}

@property (retain) Position* position;
@property (retain) Velocity* velocity;
@property int tag;

@end


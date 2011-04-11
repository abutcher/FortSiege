//
//  GameObject.m
//  FortSiege
//
//  Created by Kel Cecil on 4/4/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

@synthesize position;
@synthesize velocity;
@synthesize tag;

-(GameObject*) init {
    
    if ( (self = [super init]) ) {
        position = [[Position alloc] init];
        velocity = [[Velocity alloc] init];
    }
    return self;
}

-(void) dealloc {
    [self.position release];
    [self.velocity release];
    [super dealloc];
}

@end

@implementation Position
@synthesize x;
@synthesize y;

-(Position*) init {
    if ((self = [super init])) {
        self.x = 0;
        self.y = 0;
    }
    return self;
}

-(Position*) initWithCoordinatesX:(int)X andY:(int)Y{
    
    if ((self = [super init])) {
        self.x = X;
        self.y = Y;
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}

@end

@implementation Velocity
@synthesize deltaX;
@synthesize deltaY;

-(Velocity*) init {
    if ((self = [super init])) {
        self.deltaX = 0;
        self.deltaY = 0;
    }
    return self;
}

-(Velocity*) initWithVelocityX:(int)inputDeltaX andY:(int)inputDeltaY {
    if (self == [super init]) {
        self.deltaX = inputDeltaX;
        self.deltaY = inputDeltaY; 
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}

@end

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
@synthesize character = _character;
@synthesize state;
@synthesize facing;

+(int) getTagAndIncrement
{
    int returnValue = GameObjectTag;
    GameObjectTag = GameObjectTag + 1;
    return returnValue;
}

+(void) incrementTag {
    GameObjectTag++;
}

+(void) prepareFrames {
    
}

-(GameObject*) init {
    
    if ( (self = [super init]) ) {
        self.position = [[Position alloc] init];
        self.velocity = [[Velocity alloc] init];
        self.tag = [GameObject getTagAndIncrement];
    }
    return self;
}

-(void) updateObject:(ccTime)dt {
    if (self.state == WALKING) {
        if (self.facing == LEFT) {
            if (self.position.x < 0) {
                self.position.x = 1056;
                self.character.position = ccp(1056, self.character.position.y);  
            } else {
                self.position.x -= self.velocity.deltaX;
                self.character.position = ccp(self.character.position.x - self.velocity.deltaX, self.character.position.y);
            }
        } else if (self.facing == RIGHT) {
            self.position.x += self.velocity.deltaX;
            self.character.position = ccp(self.character.position.x + self.velocity.deltaX, self.character.position.y);
        } else {
            NSLog(@"No position set.");
        }
    } else if (self.state == ATTACKING) {
        
    } else if (self.state == STANDING) {
        
    } else {
        NSLog(@"No state set.");
    }
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
        self.deltaX = 2;
        self.deltaY = 2;
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

//
//  SmallFire.m
//  FortSiege
//
//  Created by Andrew Butcher on 4/15/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//
//  This is torch sized...

#import "SmallFire.h"


@implementation SmallFire

-(id) init
{
    if ((self == [super init])) {

    }
    
    return self;
}

-(id) initWithPosition: (CGPoint) location {
    if ((self == [super init])) {
        self.position = location;
        [self setScaleX:0.05];
        [self setScaleY:0.05];
        self.texture = [[CCTextureCache sharedTextureCache] addImage:@"fire.png"];
    }
    return self;
}

@end

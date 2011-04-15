//
//  SmallFire.m
//  FortSiege
//
//  Created by Andrew Butcher on 4/15/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//

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
        [self setScaleX:0.5];
        [self setScaleY:0.5];
        self.texture = [[CCTextureCache sharedTextureCache] addImage:@"Fire.png"];
    }
    return self;
}

@end

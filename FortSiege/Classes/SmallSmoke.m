//
//  SmallSmoke.m
//  FortSiege
//
//  Created by Andrew Butcher on 5/1/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//

#import "SmallSmoke.h"


@implementation SmallSmoke

-(id) init
{
    if ((self == [super init])) {
        
    }
    
    return self;
}

-(id) initWithPosition: (CGPoint) location {
    if ((self == [super init])) {
        self.position = location;
        [self setScaleX:0.1];
        [self setScaleY:0.1];
        self.texture = [[CCTextureCache sharedTextureCache] addImage:@"smoke.png"];
    }
    return self;
}

@end

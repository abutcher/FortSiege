//
//  DynamicGameObject.m
//  FortSiege
//
//  Created by Kel Cecil on 4/4/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "DynamicGameObject.h"


@implementation DynamicGameObject
@synthesize objectType;

-(DynamicGameObject*) init {
    if ((self = [super init])) {
        objectType = 0;
    }
    return self;
}

-(DynamicGameObject*) initWithObjectType:(enum ObjectType) incomingType {
    if ((self = [super init])) {
        objectType = incomingType;
    }
    return self;
}

-(void) dealloc {
    
    [super dealloc];
}

@end

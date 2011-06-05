//
//  globalAttributes.m
//  FortSiege
//
//  Created by Daniel Sloan on 6/5/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "globalAttributes.h"


@implementation globalAttributes
@synthesize humans;
@synthesize ogres;
@synthesize minotaurs;
@synthesize golds;

static globalAttributes* _userAttributes = nil;

+(globalAttributes*)userAttributes
{
	@synchronized([globalAttributes class])
	{
		if (!_userAttributes)
			[[self alloc] init];
        
		return _userAttributes;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([globalAttributes class])
	{
		NSAssert(_userAttributes == nil, @"Attempted to allocate a second instance of a singleton (globalAttributes).");
		_userAttributes = [super alloc];
		return _userAttributes;
	}
    
	return nil;
}

-(id)init {
	self = [super init];
	if (self != nil) {
		// initialize stuff here
	}
    
	return self;
}

@end

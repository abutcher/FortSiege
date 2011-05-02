//
//  SmallSmoke.h
//  FortSiege
//
//  Created by Andrew Butcher on 5/1/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SmallSmoke : CCParticleSmoke {
    
}

-(id) init;
-(id) initWithPosition: (CGPoint) location;

@end

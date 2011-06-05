//
//  Unit.h
//  FortSiege
//
//  Created by Jonathan Lynch on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"


@interface Unit : GameObject {
    NSString* _type;
}

@property (nonatomic, retain) NSString* type;

-(void)prepareFrames;
-(void) updateObject:(ccTime)dt;

@end

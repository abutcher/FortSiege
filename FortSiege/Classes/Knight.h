//
//  Knight.h
//  FortSiege
//
//  Created by Kel Cecil on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface Knight : GameObject {
    
}

-(void)prepareFrames;
-(void) updateObject:(ccTime)dt;
-(id) summonWithParameters: (int)x y: (int)y state: (enum State) state facing: (enum Facing) facing team: (enum Team) team;

@end

//
//  Knight.h
//  FortSiege
//
//  Created by Kel Cecil on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"
@class LevelScene;

@interface Knight : GameObject {

    
    
}

-(void)prepareFrames;
-(void) updateObject:(ccTime)dt;
-(id) summonWithParameters:(LevelScene*)inputParent x:(int)x y: (int)y state: (State) state facing: (Facing) facing;
@end

//
//  Knight.h
//  FortSiege
//
//  Created by Kel Cecil on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

#import "CC3Layer.h"
#import "CC3Light.h"
#import "FortSiegeWorld.h"
#import "CC3World.h"
#import "CC3MeshNode.h"


@interface Knight : GameObject {

    CC3Light* localSelectedLight;
    CC3Camera * localCam;
    
}

-(void)prepareFrames;
-(void)selected;
-(void)unselected;
-(void) updateObject:(ccTime)dt;

@end

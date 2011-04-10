//
//  AboutUsScene.m
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "AboutUsScene.h"


@implementation AboutUsScene

+(id) scene {
    
    CCScene *scene = [CCScene node];
    
    AboutUsScene *layer = [AboutUsScene node];
    
    [scene addChild: layer];
    
    return scene;
    
}

-(id) init{
    
    if ( ( self = [super init] )) {
        
        
        
    }
    
    return self;
    
}

@end

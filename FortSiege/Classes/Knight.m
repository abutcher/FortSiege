//
//  Knight.m
//  FortSiege
//
//  Created by Kel Cecil on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "Knight.h"


@implementation Knight

+(void) prepareFrames{
    NSMutableArray* walkingAnimationFrames = [NSMutableArray array];
    NSMutableArray* standingAnimationFrames = [NSMutableArray array];
    NSMutableArray* attackingAnimationFrames = [NSMutableArray array];
    
    for (int i = 1; i <= 6; ++i) {
        [walkingAnimationFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"knight_walk_0%d.png", i]]];
    }
    
    knight_walk = [CCAnimation animationWithFrames:walkingAnimationFrames];
    knight_walk_action = [CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:knight_walk restoreOriginalFrame:NO]];
    
    for (int i = 1; i <=1; ++i) {
        [standingAnimationFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"knight_stand_0%d.png",i]]];
    }
    
    knight_stand = [CCAnimation animationWithFrames:standingAnimationFrames];
    knight_stand_action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:knight_stand restoreOriginalFrame:NO]];
    
    for (int i = 1; i<=3; ++i) {
        [attackingAnimationFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"knight_attack_0%d.png",i]]];
    }
    
    knight_attack = [CCAnimation animationWithFrames:attackingAnimationFrames];
    knight_attack_action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:knight_attack restoreOriginalFrame:NO]];
}

-(id) init {
    
    if ( ( self = [super init] )) {
        
        if (knight_walk == nil)
            [Knight prepareFrames];
        
        self.character = [CCSprite spriteWithSpriteFrameName:@"knight_walk_01.png"];
        [self.character runAction:knight_stand_action];
        
    }
    
    return self;
}

-(void) runStandAction {
    [self.character runAction:knight_stand_action];
}

-(void) runWalkAction {
    [self.character runAction:knight_walk_action];
}

-(void) runAttackAction {
    [self.character runAction:knight_attack_action];
}

-(void) update {
    [self update];
}

@end

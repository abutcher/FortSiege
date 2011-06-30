//
//  Knight.m
//  FortSiege
//
//  Created by Kel Cecil on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "Knight.h"


@implementation Knight

-(void) prepareFrames{
    NSMutableArray* walkingAnimationFrames = [NSMutableArray array];
    NSMutableArray* standingAnimationFrames = [NSMutableArray array];
    NSMutableArray* attackingAnimationFrames = [NSMutableArray array];
    
    for (int i = 1; i <= 6; ++i) {
        [walkingAnimationFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"knight_walk_0%d.png", i]]];
    }
    
    self.walkAnimation = [CCAnimation animationWithFrames:walkingAnimationFrames delay:0.1f];
    self.walkAction = [CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:self.walkAnimation restoreOriginalFrame:YES]];
    
    for (int i = 1; i <=1; ++i) {
        [standingAnimationFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"knight_stand_0%d.png",i]]];
    }
    
    self.standAnimation = [CCAnimation animationWithFrames:standingAnimationFrames delay:0.1f];
    self.standAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.standAnimation restoreOriginalFrame:YES]];
    
    for (int i = 1; i<=3; ++i) {
        [attackingAnimationFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"knight_attack_0%d.png",i]]];
    }
    
    
    
}

-(id) init {
    
    if ( ( self = [super init] )) {
        
        [self prepareFrames];
        
        self.character = [CCSprite spriteWithSpriteFrameName:@"knight_walk_01.png"];
        [self runWalkAction];
        
        
    }
    
    
    
    return self;
}

-(id) summonWithParameters: (int)x y: (int)y state: (enum State) state facing: (enum Facing) facing {
    return [self summonWithParameters: x y:y state:state facing:facing team:PLAYER];
}

-(id) summonWithParameters: (int)x y: (int)y state: (enum State) state facing: (enum Facing) facing team: (enum Team) team {
    if (( self = [super init])) {
        
        [self prepareFrames];
        
        self.name = @"knight";
        
        self.state = state;
        self.facing = facing;
        self.team = team;
        
        if (self.state == WALKING) {
            self.character = [CCSprite spriteWithSpriteFrameName:@"knight_walk_01.png"];
            [self runWalkAction];
        }
        else if (self.state == STANDING) {
            self.character = [CCSprite spriteWithSpriteFrameName:@"knight_stand_01.png"];
            [self runStandAction];
        }
        
        self.position.x = x;
        self.position.y = y;
        self.character.position = ccp(x, y);

        self.collideable = true;    
        
    }
    
    return self;
}

-(void) collideWith:(GameObject *)actor {
    [self runAttackAction];
    NSLog(@"%@ collided with %@", self.name, actor.name);
}

-(void) updateObject:(ccTime)dt {
    [super updateObject:dt];
}

@end

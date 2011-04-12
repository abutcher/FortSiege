//
//  Knight.h
//  FortSiege
//
//  Created by Kel Cecil on 4/11/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

static CCAnimation* knight_walk;
static CCAnimation* knight_stand;
static CCAnimation* knight_attack;
static CCAction* knight_walk_action;
static CCAction* knight_stand_action;
static CCAction* knight_attack_action;

@interface Knight : GameObject {

}

+(void)prepareFrames;
-(void) updateObject:(ccTime)dt;
-(void) runWalkAction;
-(void) runAttackAction;
-(void) runStandAction;

@end

//
//  DynamicGameObject.h
//  FortSiege
//
//  Created by Kel Cecil on 4/4/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "GameObject.h"
#import <Foundation/Foundation.h>



@interface DynamicGameObject : GameObject {

}

enum ObjectType {
    archer = 0,
    barrelman = 1,
    kingar = 2,
    knight = 3,
    soldier = 4
};
@property enum ObjectType objectType;

-(DynamicGameObject*) init;
-(DynamicGameObject*) initWithObjectType: (enum ObjectType) incomingType;
-(void) dealloc;

@end

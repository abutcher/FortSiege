//
//  GameObject.m
//  FortSiege
//
//  Created by Kel Cecil on 4/4/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

@synthesize position;
@synthesize velocity;
@synthesize selectedP;
@synthesize tag;
@synthesize selectRect = _selectRect;
@synthesize character = _character;
@synthesize walkAction = _walkAction;
@synthesize standAction = _standAction;
@synthesize attackAction = _attackAction;
@synthesize walkAnimation = _walkAnimation;
@synthesize standAnimation = _standAnimation;
@synthesize attackAnimation = _attackAnimation;

@synthesize collideable;
@synthesize maxHitPoints;
@synthesize maxManaPoints;
@synthesize currHitPoints;
@synthesize currManaPoints;
@synthesize attackDamage;


@synthesize state;
@synthesize facing;

+(int) getTagAndIncrement
{
    int returnValue = GameObjectTag;
    GameObjectTag = GameObjectTag + 1;
    return returnValue;
}

+(void) incrementTag {
    GameObjectTag++;
}

-(GameObject*) init {

    
    if ( (self = [super init]) ) {
        self.position = [[Position alloc] init];
        self.velocity = [[Velocity alloc] init];
        self.tag = [GameObject getTagAndIncrement];
    }
    
    self.selectRect = [CCSprite spriteWithSpriteFrameName:@"blank.png"];
    
    return self;
}

-(void) selected{
    self.selectRect = [CCSprite spriteWithSpriteFrameName:@"selection.png"];
    self.selectedP = true;
    

    if ([FortSiegeWorld mainWorld]->localSelectedLight != NULL) 
    {    
        [FortSiegeWorld mainWorld]->localSelectedLight.location = cc3v(self.character.position.x, self.character.position.y, -500.0);                
        [FortSiegeWorld mainWorld]->localSelectedLight.visible = true;
    }
        
            
    
}

-(void) unselected{
    //erase selection rect?
//    [self.selectRect dealloc];    
//    self.selectRect = NULL;
//    self.selectRect = [CCSprite spriteWithSpriteFrameName:@"dirt.png"];
    self.selectedP = false;
    if ([FortSiegeWorld mainWorld]->localSelectedLight != NULL)         
        [FortSiegeWorld mainWorld]->localSelectedLight.visible = false;
    
}


-(void) updateObject:(ccTime)dt {
    if (self.state == WALKING) {
        if (self.facing == LEFT) {
            if (self.position.x < -100) {
                self.position.x = 1500;
                self.character.position = ccp(1500, self.character.position.y);  
            } else {
                self.position.x -= self.velocity.deltaX;
                self.character.position = ccp(self.character.position.x - 25*dt, self.character.position.y);
            }
        } else if (self.facing == RIGHT) {
            self.position.x += self.velocity.deltaX;
            self.character.position = ccp(self.character.position.x + 25*dt, self.character.position.y);
        } else {
            NSLog(@"No position set.");
        }
    } else if (self.state == ATTACKING) {
        
    } else if (self.state == STANDING) {
        
    } else {
        NSLog(@"No state set.");
    }
    
    if (self.selectedP)
    {
        self.selectRect.position = ccp(self.character.position.x, self.character.position.y); 
        if ([FortSiegeWorld mainWorld]->localSelectedLight != NULL)
        {
            [FortSiegeWorld mainWorld]->localSelectedLight.location = cc3v(self.character.position.x, self.character.position.y, -500.0);            
        }
        printf("%f %f location of light", self.character.position.x, self.character.position.y);
    }
    
    
}

-(void) runStandAction {
    [self.character runAction:self.standAction];
}

-(void) runWalkAction {
    [self.character runAction:self.walkAction];
}

-(void) runAttackAction {
    [self.character runAction:self.attackAction];
}


-(void) dealloc {
    [self.position release];
    [self.velocity release];
    [super dealloc];
}

@end

@implementation Position
@synthesize x;
@synthesize y;

-(Position*) init {
    if ((self = [super init])) {
        self.x = 0;
        self.y = 0;
    }
    return self;
}

-(Position*) initWithCoordinatesX:(int)X andY:(int)Y{
    
    if ((self = [super init])) {
        self.x = X;
        self.y = Y;
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}

@end

@implementation Velocity
@synthesize deltaX;
@synthesize deltaY;

-(Velocity*) init {
    if ((self = [super init])) {
        self.deltaX = 1;
        self.deltaY = 1;
    }
    return self;
}

-(Velocity*) initWithVelocityX:(int)inputDeltaX andY:(int)inputDeltaY {
    if (self == [super init]) {
        self.deltaX = inputDeltaX;
        self.deltaY = inputDeltaY; 
    }
    return self;
}

-(void) dealloc {
    [super dealloc];
}

@end

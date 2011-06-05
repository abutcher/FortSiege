
//
//  selectedMenu.m
//  FortSiege
//
//  Created by Daniel Sloan on 6/5/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "SelectedMenu.h"


//this menu is for particular units
@implementation SelectedMenu

@synthesize parent;

// on "init" you need to initialize your instance
-(id) init
{
    
    self.isTouchEnabled = YES;
    if( (self=[super init] )) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];		
        
        bigMenu = [CCSprite spriteWithSpriteFrameName:@"menu.png"];        
        bigMenu.position = ccp(250.0, 50.0);        
		[self addChild:bigMenu];
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Create a label for display purposes
        _label = [[CCLabelTTF labelWithString:@"Last button: None" 
                                   dimensions:CGSizeMake(520, 50) alignment:UITextAlignmentCenter 
                                     fontName:@"Arial" fontSize:32.0] retain];
        _label.position = ccp(winSize.width/2, 
                              winSize.height-(_label.contentSize.height/2));
        [self addChild:_label];
        
        
        
        menuItem1.position = ccp(153, 40);
        menuItem2.position = ccp(186, 40);
        menuItem3.position = ccp(219, 40);
        menuItem4.position = ccp(250, 40);
        menuItem5.position = ccp(282, 40);
        menuItem6.position = ccp(314, 40);
        menuItem7.position = ccp(347, 40);
        
                
    }
    return self;
}

//setup a menu for the corresponding gameobject's associated actions
- (void)setup:(GameObject*)type {
    
    normal1 = [CCSprite spriteWithSpriteFrameName:@"knight_button.png"];
    selected1 = [CCSprite spriteWithSpriteFrameName:@"knight_button.png"];
    
    menuItem1 = [CCMenuItemSprite itemFromNormalSprite:normal1
                                        selectedSprite:selected1
                                                target:self selector:@selector(butt1Tapped:)];
    
    normal2 = [CCSprite spriteWithSpriteFrameName:@"black_wiz_button.png"];
    selected2 = [CCSprite spriteWithSpriteFrameName:@"black_wiz_button.png"];
    
    menuItem2 = [CCMenuItemSprite itemFromNormalSprite:normal2
                                        selectedSprite:selected2
                                                target:self selector:@selector(butt2Tapped:)];
    
    normal3 = [CCSprite spriteWithSpriteFrameName:@"archer_button.png"];
    selected3 = [CCSprite spriteWithSpriteFrameName:@"archer_button.png"];
    
    menuItem3 = [CCMenuItemSprite itemFromNormalSprite:normal3
                                        selectedSprite:selected3
                                                target:self selector:@selector(butt3Tapped:)];
    
    normal4 = [CCSprite spriteWithSpriteFrameName:@"barrel_button.png"];
    selected4 = [CCSprite spriteWithSpriteFrameName:@"barrel_button.png"];
    
    menuItem4 = [CCMenuItemSprite itemFromNormalSprite:normal4
                                        selectedSprite:selected4
                                                target:self selector:@selector(butt4Tapped:)];
    
    normal5 = [CCSprite spriteWithSpriteFrameName:@"white_wiz_button.png"];
    selected5 = [CCSprite spriteWithSpriteFrameName:@"white_wiz_button.png"];
    
    menuItem5 = [CCMenuItemSprite itemFromNormalSprite:normal5
                                        selectedSprite:selected5
                                                target:self selector:@selector(butt5Tapped:)];
    
    normal6 = [CCSprite spriteWithSpriteFrameName:@"engineer_button.png"];
    selected6 = [CCSprite spriteWithSpriteFrameName:@"engineer_button.png"];
    
    menuItem6 = [CCMenuItemSprite itemFromNormalSprite:normal6
                                        selectedSprite:selected6
                                                target:self selector:@selector(butt6Tapped:)];
    
    normal7 = [CCSprite spriteWithSpriteFrameName:@"soldier_button.png"];
    selected7 = [CCSprite spriteWithSpriteFrameName:@"soldier_button.png"];
    
    menuItem7 = [CCMenuItemSprite itemFromNormalSprite:normal7
                                        selectedSprite:selected7
                                                target:self selector:@selector(butt7Tapped:)];
    
    CCMenu *mainMenu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, menuItem4, menuItem5, menuItem6, menuItem7, nil];
    mainMenu.position = CGPointZero;
    //        menuItemOne.selectedImage = norm;
    //        menuItem1.normalImage = selected;
    [self addChild:mainMenu];  
    
}


- (void)butt1Tapped:(id)sender {
    [self.parent addGameObject:[[Knight alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]];             
}
- (void)butt2Tapped:(id)sender {
    [self.parent addGameObject:[[KingArthur alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
}
- (void)butt3Tapped:(id)sender {
    [self.parent addGameObject:[[Archer alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
}
- (void)butt4Tapped:(id)sender {
    [self.parent addGameObject:[[Barrelman alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
}
- (void)butt5Tapped:(id)sender {
    [self.parent addGameObject:[[KingArthur alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
}
- (void)butt6Tapped:(id)sender {
    [self.parent addGameObject:[[KingArthur alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
}
- (void)butt7Tapped:(id)sender {
    [self.parent addGameObject:[[Soldier alloc] summonWithParameters: 758 y:296 state:WALKING facing:LEFT]]; 
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [_label release];
    _label = nil;    
    
	[bigMenu release];
    bigMenu = nil;
    
	[normal1 release];
    normal1 = nil;
	[normal2 release];
    normal2 = nil;
	[normal3 release];
    normal3 = nil;
	[normal4 release];
    normal4 = nil;
	[normal5 release];
    normal5 = nil;
	[normal6 release];
    normal6 = nil;
	[normal7 release];
    normal7 = nil;
    
	[selected1 release];
    selected1 = nil;
	[selected2 release];
    selected2 = nil;
	[selected3 release];
    selected3 = nil;
	[selected4 release];
    selected4 = nil;
	[selected5 release];
    selected5 = nil;
	[selected6 release];
    selected6 = nil;
	[selected7 release];
    selected7 = nil;
    
	[menuItem1 release];
    menuItem1 = nil;
	[menuItem2 release];
    menuItem2 = nil;
	[menuItem3 release];
    menuItem3 = nil;
	[menuItem4 release];
    menuItem4 = nil;
	[menuItem5 release];
    menuItem5 = nil;
	[menuItem6 release];
    menuItem6 = nil;
	[menuItem7 release];
    menuItem7 = nil;
    
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
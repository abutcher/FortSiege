//
//  MainMenuScene.m
//  FortSiege
//
//  Created by Kel Cecil on 4/10/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import "MainMenuScene.h"


@implementation MainMenuScene

+(id) scene 
{
    
    CCScene *scene = [CCScene node];
    
    MainMenuScene *layer = [MainMenuScene node];
    
    [scene addChild: layer];
    
    return scene;
    
}

-(void) startGame
{
    NSLog(@"Start game");
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [[CCDirector sharedDirector] replaceScene:[LevelScene scene]];
    
}

-(void) aboutUs
{
    NSLog(@"About us");
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [[CCDirector sharedDirector] replaceScene:[AboutUsScene node]]; 
                                               
}

-(id) init
{
    self.isTouchEnabled = YES;
    
    if ( ( self=[super init] )) 
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        _title = [[CCLabelTTF labelWithString:@"FortSiege" dimensions:CGSizeMake(320, 30) alignment:UITextAlignmentCenter fontName:@"Arial" fontSize:32.0] retain];
        _title.position = ccp(winSize.width/2, 700);
        [self addChild:_title];
        
        NSLog(@"init a la fortsiege");
        
        CCLabelTTF *_startGame = [[CCLabelTTF labelWithString:@"Start Game" fontName:@"Arial" fontSize:32.0] retain];
        CCMenuItem *startGameItem = [CCMenuItemLabel itemWithLabel:_startGame target:self selector:@selector(startGame)];
        startGameItem.position = ccp(winSize.width/2, 200);
        
        CCLabelTTF *_aboutUs = [[CCLabelTTF labelWithString:@"About" fontName:@"Arial" fontSize:32.0] retain];
        CCMenuItem *aboutUsItem = [CCMenuItemLabel itemWithLabel:_aboutUs target:self selector:@selector(aboutUs)];
        aboutUsItem.position = ccp(winSize.width/2,150);
        
        CCMenu *homeMenu = [CCMenu menuWithItems:startGameItem,aboutUsItem,nil];
        homeMenu.position = CGPointZero;
        [self addChild:homeMenu];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"saltarello.mp3" loop:YES];
    }
    
    return self;
}

-(void) dealloc
{

    [super dealloc];
    
}

@end

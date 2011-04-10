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
    
    [[CCDirector sharedDirector] replaceScene:[LevelScene node]];
    
}

-(void) aboutUs
{
    [[CCDirector sharedDirector] replaceScene:[AboutUsScene node]]; 
                                               
}

-(id) init
{
    
    if ( ( self=[super init] )) 
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        _title = [[CCLabelTTF labelWithString:@"FortSiege" dimensions:CGSizeMake(320, 30) alignment:UITextAlignmentCenter fontName:@"Arial" fontSize:32.0] retain];
        _title.position = ccp(winSize.width/2, 700);
        [self addChild:_title];
        
        CCLabelTTF *_startGame = [[CCLabelTTF labelWithString:@"Start Game" fontName:@"Arial" fontSize:32.0] retain];
        //_startGame.position = ccp(winSize.width/2, 500);
        CCMenuItem *startGameItem = [CCMenuItemLabel itemWithLabel:_startGame target:nil selector:@selector(startGame)];
        
        CCLabelTTF *_aboutUs = [[CCLabelTTF labelWithString:@"About" fontName:@"Arial" fontSize:32.0] retain];
        _aboutUs.position = ccp(winSize.width/2, 450);
        CCMenuItem *aboutUsItem = [CCMenuItemLabel itemWithLabel:_aboutUs target:nil selector:@selector(aboutUs)];
        
        CCMenu *homeMenu = [CCMenu menuWithItems:startGameItem,aboutUsItem,nil];
        [self addChild:homeMenu];
    }
    
    return self;
}

-(void) dealloc
{

    [super dealloc];
    
}

@end

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

-(void) BackToHome
{
    [[CCDirector sharedDirector] replaceScene:[MainMenuScene node]];
}

-(id) init{
    
    if ( ( self = [super init] )) {
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        NSLog(@"init a la fortsiege");
        
        CCLabelTTF *_back = [[CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:32.0] retain];
        CCMenuItem *_backItem = [CCMenuItemLabel itemWithLabel:_back target:self selector:@selector(BackToHome)];
        _backItem.position = ccp(winSize.width/10,50);
        
        CCMenu *aboutMenu = [CCMenu menuWithItems:_backItem,nil];
        aboutMenu.position = CGPointZero;
        [self addChild:aboutMenu];        
        
    }
    
    return self;
    
}

@end

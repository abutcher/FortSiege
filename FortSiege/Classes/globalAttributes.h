//
//  globalAttributes.h
//  FortSiege
//
//  Created by Daniel Sloan on 6/5/11.
//  Copyright 2011 WVU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface globalAttributes : NSObject {
@private
    //dudes available to hire and train, NOT the ones already on the screen
    int humans;
    int ogres;
    int minotaurs;
    int golds;
    
    
}

@property int humans;
@property int ogres;
@property int minotaurs;
//etc whatever we'll add this shit as we go

@property int golds;


+(globalAttributes*)userAttrib;

@end
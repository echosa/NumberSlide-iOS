//
//  SlideGame.h
//  SlideGame
//
//  Created by Brian Zwahr on 8/25/12.
//  Copyright (c) 2012 echosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlideGame : NSObject
{
    NSInteger gameArray[4][4];
}
- (void) setPosition: (NSInteger)x : (NSInteger)y : (NSInteger)value;
- (NSInteger) getPosition: (NSInteger)x : (NSInteger)y;
- (void) randomizeTiles;
@end

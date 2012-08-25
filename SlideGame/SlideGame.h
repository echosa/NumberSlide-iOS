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
    NSMutableArray *gameArray;
}

- (id) init;
- (void) correctTiles;
- (void) setPosition: (NSUInteger)x : (NSUInteger)y : (NSNumber*)value;
- (NSNumber*) getPosition: (NSUInteger)x : (NSUInteger)y;
- (NSMutableArray*) getBoardArray;
- (void) randomizeTiles;
- (void) moveTile: (NSUInteger)x : (NSUInteger)y;
- (void) printBoardDebug;

@end

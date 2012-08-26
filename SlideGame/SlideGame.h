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
    NSArray *correctArray;
}

@property bool active;

- (id) init;
- (void) correctTiles;
- (void) setPosition: (NSUInteger)x : (NSUInteger)y : (NSNumber*)value;
- (NSNumber*) getPosition: (NSUInteger)x : (NSUInteger)y;
- (NSMutableArray*) getBoardArray;
- (NSArray*) getCorrectArray;
- (NSArray*) findTilePosition: (NSInteger)value;
- (void) randomizeTiles;
- (void) moveTile: (NSUInteger)x : (NSUInteger)y;
- (bool) isAWin;
- (void) printBoardDebug;

@end

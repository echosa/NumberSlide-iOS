//
//  SlideGame.m
//  SlideGame
//
//  Created by Brian Zwahr on 8/25/12.
//  Copyright (c) 2012 echosa. All rights reserved.
//

#import "SlideGame.h"

@implementation SlideGame

- (id) init
{
    gameArray = [NSMutableArray arrayWithCapacity:4];
    [gameArray addObject:[NSMutableArray arrayWithCapacity:4]];
    [gameArray addObject:[NSMutableArray arrayWithCapacity:4]];
    [gameArray addObject:[NSMutableArray arrayWithCapacity:4]];
    [gameArray addObject:[NSMutableArray arrayWithCapacity:4]];
    [self correctTiles];
    
    //correctArray = [NSArray arrayWithArray:gameArray];
    correctArray = [NSArray arrayWithObjects:
                    [NSArray arrayWithObjects:
                     [NSNumber numberWithInt:1],
                     [NSNumber numberWithInt:2],
                     [NSNumber numberWithInt:3],
                     [NSNumber numberWithInt:4],
                     nil],
                    [NSArray arrayWithObjects:
                     [NSNumber numberWithInt:5],
                     [NSNumber numberWithInt:6],
                     [NSNumber numberWithInt:7],
                     [NSNumber numberWithInt:8],
                     nil],
                    [NSArray arrayWithObjects:
                     [NSNumber numberWithInt:9],
                     [NSNumber numberWithInt:10],
                     [NSNumber numberWithInt:11],
                     [NSNumber numberWithInt:12],
                     nil],
                    [NSArray arrayWithObjects:
                     [NSNumber numberWithInt:13],
                     [NSNumber numberWithInt:14],
                     [NSNumber numberWithInt:15],
                     [NSNumber numberWithInt:0],
                     nil],
                    nil];
    return self;
}

- (void) correctTiles
{
    NSNumber *value;
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            value = [NSNumber numberWithInt:x * 4 + y + 1];
            [self setPosition:x :y :value];
        }
    }
    [self setPosition:3 :3 :[NSNumber numberWithInt:0]];
}

- (void) setPosition: (NSUInteger)x : (NSUInteger)y : (NSNumber*)value
{
    [[gameArray objectAtIndex:x] setObject:value atIndex:y];
}

- (NSNumber*) getPosition: (NSUInteger)x : (NSUInteger)y
{
    return [[gameArray objectAtIndex:x] objectAtIndex:y];
}

- (NSMutableArray*) getBoardArray
{
    return gameArray;
}

- (NSArray*) getCorrectArray
{
    return correctArray;
}

- (void) randomizeTiles
{
    
}

- (void) moveTile: (NSUInteger)x : (NSUInteger) y
{
    NSNumber *tileValue = [self getPosition:x :y];
    NSNumber *zero = [NSNumber numberWithInt:0];
    if (tileValue > 0) {
        // move up
        if (x > 0 && [[self getPosition:x - 1 :y] intValue] == 0) {
            [self setPosition:x - 1 :y :tileValue];
            [self setPosition:x :y :zero];
        }
        // move down
        if (x < 3 && [[self getPosition:x + 1 :y] intValue] == 0) {
            [self setPosition:x + 1 :y :tileValue];
            [self setPosition:x :y :zero];
        }
        // move left
        if (y > 0 && [[self getPosition:x :y - 1] intValue] == 0) {
            [self setPosition:x :y - 1 :tileValue];
            [self setPosition:x :y :zero];
        }
        // move right
        if (y < 3 && [[self getPosition:x :y + 1] intValue] == 0) {
            [self setPosition:x :y + 1 :tileValue];
            [self setPosition:x :y :zero];
        }
    }
}

- (bool) isAWin
{
    return [gameArray isEqualToArray:correctArray];
}

- (void) printBoardDebug
{
    NSLog(@"%d %d %d %d",
          [[self getPosition:0 :0] intValue],
          [[self getPosition:0 :1] intValue],
          [[self getPosition:0 :2] intValue],
          [[self getPosition:0 :3] intValue]);
    NSLog(@"%d %d %d %d",
          [[self getPosition:1 :0] intValue],
          [[self getPosition:1 :1] intValue],
          [[self getPosition:1 :2] intValue],
          [[self getPosition:1 :3] intValue]);
    NSLog(@"%d %d %d %d",
          [[self getPosition:2 :0] intValue],
          [[self getPosition:2 :1] intValue],
          [[self getPosition:2 :2] intValue],
          [[self getPosition:2 :3] intValue]);
    NSLog(@"%d %d %d %d",
          [[self getPosition:3 :0] intValue],
          [[self getPosition:3 :1] intValue],
          [[self getPosition:3 :2] intValue],
          [[self getPosition:3 :3] intValue]);
}

@end
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
    return self;
}

- (void) correctTiles
{
    NSNumber *value;
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            value = [NSNumber numberWithInt:x * 10 + y + 1];
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

- (void) randomizeTiles
{
    
}

- (void) moveTile: (NSUInteger)x : (NSUInteger) y
{
    NSNumber *tileValue = [self getPosition:x :y];
    if (tileValue > 0) {
        // check up
        if (x > 0 && [self getPosition:x - 1 :y] == 0) {
            [self setPosition:x - 1 :y :tileValue];
            [self setPosition:x :y :0];
        }
        // check down
        if (x < 3 && [self getPosition:x + 1 :y] == 0) {
            [self setPosition:x + 1 :y :tileValue];
            [self setPosition:x :y :0];
        }
        // check left
        if (y > 0 && [self getPosition:x :y - 1] == 0) {
            [self setPosition:x :y - 1 :tileValue];
            [self setPosition:x :y :0];
        }
        // check left
        if (y < 3 && [self getPosition:x :y + 1] == 0) {
            [self setPosition:x :y + 1 :tileValue];
            [self setPosition:x :y :0];
        }
    }
}

@end
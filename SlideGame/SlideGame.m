//
//  SlideGame.m
//  SlideGame
//
//  Created by Brian Zwahr on 8/25/12.
//  Copyright (c) 2012 echosa. All rights reserved.
//

#import "SlideGame.h"

@implementation SlideGame

- (void) setPosition: (NSInteger)x : (NSInteger)y : (NSInteger)value
{
    gameArray[x][y] = value;
}

- (NSInteger) getPosition: (NSInteger)x : (NSInteger)y
{
    return gameArray[x][y];
}

- (void) randomizeTiles
{
    
}

@end
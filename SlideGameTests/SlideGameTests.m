//
//  SlideGameTests.m
//  SlideGameTests
//
//  Created by Brian Zwahr on 8/25/12.
//  Copyright (c) 2012 echosa. All rights reserved.
//

#import "SlideGameTests.h"
#import "SlideGame.h"

@implementation SlideGameTests

SlideGame* game;

- (void)setUp
{
    [super setUp];
    game = [[SlideGame alloc] init];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSettingBoardPositions
{
    [game setPosition:0 :0 :[NSNumber numberWithInt:100]];
    [game setPosition:1 :0 :[NSNumber numberWithInt:101]];
    [game setPosition:2 :1 :[NSNumber numberWithInt:102]];
    [game setPosition:3 :3 :[NSNumber numberWithInt:103]];
    
    STAssertEquals(100, [[game getPosition:0 :0] intValue], @"Wrong value");
    STAssertEquals(101, [[game getPosition:1 :0] intValue], @"Wrong value");
    STAssertEquals(102, [[game getPosition:2 :1] intValue], @"Wrong value");
    STAssertEquals(103, [[game getPosition:3 :3] intValue], @"Wrong value");
}

- (void)testMovingTiles
{
    game.active = true;
    [game moveTile:0 :0];
    STAssertEquals(1, [[game getPosition:0 :0] intValue], @"Wrong value");

    // test moving 15 to the right
    [game moveTile:3 :2];
    STAssertEquals(0, [[game getPosition:3 :2] intValue], @"Wrong value");
    STAssertEquals(15, [[game getPosition:3 :3] intValue], @"Wrong value");
    // and back
    [game moveTile:3 :3];
    STAssertEquals(0, [[game getPosition:3 :3] intValue], @"Wrong value");
    STAssertEquals(15, [[game getPosition:3 :2] intValue], @"Wrong value");

    // test moving 12 downwards
    [game moveTile:2 :3];
    STAssertEquals(0, [[game getPosition:2 :3] intValue], @"Wrong value");
    STAssertEquals(12, [[game getPosition:3 :3] intValue], @"Wrong value");
    // and back
    [game moveTile:3 :3];
    STAssertEquals(0, [[game getPosition:3 :3] intValue], @"Wrong value");
    STAssertEquals(12, [[game getPosition:2 :3] intValue], @"Wrong value");

    // test moving 12 downwards
    [game moveTile:2 :3];
    STAssertEquals(0, [[game getPosition:2 :3] intValue], @"Wrong value");
    STAssertEquals(12, [[game getPosition:3 :3] intValue], @"Wrong value");
    // then moving 11 to the right
    [game moveTile:2 :2];
    STAssertEquals(0, [[game getPosition:2 :2] intValue], @"Wrong value");
    STAssertEquals(11, [[game getPosition:2 :3] intValue], @"Wrong value");
    // then moving 11 back to the left
    [game moveTile:2 :3];
    STAssertEquals(0, [[game getPosition:2 :3] intValue], @"Wrong value");
    STAssertEquals(11, [[game getPosition:2 :2] intValue], @"Wrong value");
    // then moving 12 back up
    [game moveTile:3 :3];
    STAssertEquals(0, [[game getPosition:3 :3] intValue], @"Wrong value");
    STAssertEquals(12, [[game getPosition:2 :3] intValue], @"Wrong value");
}

- (void)testFindingBoardPositions
{
    NSArray* position;
    
    position = [game findTilePosition:1];
    STAssertEquals(0, [[position objectAtIndex:0] intValue], @"Checking x position of 0");
    STAssertEquals(0, [[position objectAtIndex:1] intValue], @"Checking y position of 0");

    position = [game findTilePosition:15];
    STAssertEquals(3, [[position objectAtIndex:0] intValue], @"Checking x position of 0");
    STAssertEquals(2, [[position objectAtIndex:1] intValue], @"Checking y position of 0");
    
    position = [game findTilePosition:0];
    STAssertEquals(3, [[position objectAtIndex:0] intValue], @"Checking x position of 0");
    STAssertEquals(3, [[position objectAtIndex:1] intValue], @"Checking y position of 0");
    
}

- (void)testWinningBoard
{
    game.active = true;
    STAssertTrue([game isAWin], @"Testing game is initially a win.");
    [game moveTile:3 :2];
    STAssertFalse([game isAWin], @"Testing game is not a win.");
    [game moveTile:3 :3];
    STAssertTrue([game isAWin], @"Testing game is a win.");
}

- (void)testRandomBoard
{
    game.active = true;
    [game randomizeTiles];
    STAssertFalse([game isAWin], @"Random game should not be a win.");
}

@end

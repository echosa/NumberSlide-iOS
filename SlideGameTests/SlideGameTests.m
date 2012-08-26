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

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSettingBoardPositions
{
    SlideGame* game = [[SlideGame alloc] init];
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
    SlideGame* game = [[SlideGame alloc] init];

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

- (void)testWinningBoard
{
    SlideGame* game = [[SlideGame alloc] init];
    STAssertTrue([game isAWin], @"Testing game is initially a win.");
    [game moveTile:3 :2];
    STAssertFalse([game isAWin], @"Testing game is not a win.");
    [game moveTile:3 :3];
    STAssertTrue([game isAWin], @"Testing game is a win.");
}

@end

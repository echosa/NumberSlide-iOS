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
    NSLog(@"The game array size is %d", [[game getBoardArray] count]);
    [game setPosition:0 :0 :[NSNumber numberWithInt:100]];
    [game setPosition:1 :0 :[NSNumber numberWithInt:101]];
    [game setPosition:2 :1 :[NSNumber numberWithInt:102]];
    [game setPosition:3 :3 :[NSNumber numberWithInt:103]];
    
    STAssertEquals(100, [[game getPosition:0 :0] intValue], @"Wrong value");
    STAssertEquals(101, [[game getPosition:1 :0] intValue], @"Wrong value");
    STAssertEquals(102, [[game getPosition:2 :1] intValue], @"Wrong value");
    STAssertEquals(103, [[game getPosition:3 :3] intValue], @"Wrong value");
}

//- (void)testMovingTiles
//{
//    SlideGame* game = [[SlideGame alloc] init];
    
//}

@end

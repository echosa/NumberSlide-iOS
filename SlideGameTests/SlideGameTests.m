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
    SlideGame* game = [SlideGame alloc];
    int value;
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            value = 100 + (x * 10 + y);
            [game setPosition:x :y :value];
        }
        
    }
    STAssertEquals(100, [game getPosition:0 :0], @"Wrong value");
    STAssertEquals(110, [game getPosition:1 :0], @"Wrong value");
    STAssertEquals(121, [game getPosition:2 :1], @"Wrong value");
    STAssertEquals(133, [game getPosition:3 :3], @"Wrong value");
}

@end

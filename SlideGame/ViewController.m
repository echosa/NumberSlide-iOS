//
//  ViewController.m
//  SlideGame
//
//  Created by Brian Zwahr on 8/25/12.
//  Copyright (c) 2012 echosa. All rights reserved.
//

#import "ViewController.h"
#import "SlideGame.h"

@implementation ViewController

SlideGame* game;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)newGame:(id)sender
{
    game = [[SlideGame alloc] init];
    [game randomizeTiles];
    [self printBoard];
    game.active = true;
}

- (IBAction)pushTile:(id)sender
{
    NSArray* position = [game findTilePosition:[sender tag]];
    [game moveTile:[[position objectAtIndex:0] intValue]
                  :[[position objectAtIndex:1] intValue]];
    [self printBoard];

    if ([game isAWin]) {
        UIAlertView *win = [[UIAlertView alloc] initWithTitle: @"Good job!"
                                                      message: @"You won!"
                                                     delegate: self
                                            cancelButtonTitle: @"Ok"
                                            otherButtonTitles: nil];

         [win show];
        game.active = false;
    }
}

- (void)printBoard
{
    int tile;
    UIButton* button;
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            tile = [[game getPosition:x :y] intValue];
            if (tile != 0) {
                button = (UIButton *)[self.view viewWithTag:tile];
                CGRect rect = CGRectMake(y * 70 + 20, x * 70 + 90, 70, 70);
                [button setFrame:rect];
            }
        }
    }
}

@end

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
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Game!"
//                                                    message:@"Start a new game"
//                                                   delegate:nil
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    
    SlideGame* game = [[SlideGame alloc] init];
    [game randomizeTiles];
    [self printBoard:game];
//    UIButton* button = (UIButton *)[self.view viewWithTag:15];
//    int top = 3 * 70 + 90;
//    int left = 3 * 70 + 20;
//    CGRect rect = CGRectMake(left, top, 70, 70);
//    [button setFrame:rect];
}

- (void)printBoard:(SlideGame*)game
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

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

- (IBAction)newGame:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Game!"
                                                    message:@"Start a new game"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    SlideGame* game = [SlideGame alloc];
    [game randomizeTiles];
}

@end

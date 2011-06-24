//
//  PushButtonsViewController.m
//  PushButton
//
//  Created by Karmadude on 6/24/11.
//  Copyright 2011 VUnite Media. All rights reserved.
//

#import "PushButtonsViewController.h"
#import "PushButtonView.h"

@implementation PushButtonsViewController

@synthesize button1=_button1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Do any additional setup after loading the view from its nib.
        self.button1 = [[PushButtonView alloc] initWithFrame:CGRectMake(self.view.center.x - 100,80,200,60)];
        [self.view addSubview:_button1];
    }
    return self;
}

- (void)dealloc
{
    [_button1 release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

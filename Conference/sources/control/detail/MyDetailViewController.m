//
//  MyDetailViewController.m
//  Conference
//
//  Created by wu xiaofang on 13-6-14.
//  Copyright (c) 2013年 wu xiaofang. All rights reserved.
//

#import "MyDetailViewController.h"

@interface MyDetailViewController ()

@end

@implementation MyDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    MeetingManageViewController *meet = [[MeetingManageViewController alloc]init];
    [self.navigationController pushViewController:meet animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Cards", @"Cards");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

@end

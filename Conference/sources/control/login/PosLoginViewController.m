//
//  PosLoginViewController.m
//  PosProject
//
//  Created by wu xiaofang on 13-6-7.
//  Copyright (c) 2013年 xiaofang.wu. All rights reserved.
//

#import "PosLoginViewController.h"
#import "PosCore.h"

@interface PosLoginViewController ()
@property (nonatomic,retain)UIButton* loginButton;
- (void)initLoginSubViews;
- (void)loginButtonPress;
- (void)handleLoginNotification:(NSNotification*)notify;
@end

@implementation PosLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initLoginSubViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    addObserverToNotificationCenter(self, @selector(handleLoginNotification:), PosLoginNotification);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    removeObserverFromNotificationCenter(self);
}

- (void)releaseAllSubViews
{
    [super releaseAllSubViews];
    self.loginButton = nil;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat viewWidth = self.view.bounds.size.width;
    self.loginButton.frame = CGRectMake(20, 130, viewWidth - 40, 35);
    
}

#pragma mark - Internal
// init
- (void)initLoginSubViews
{
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
}



// button press

- (void)loginButtonPress
{
//    [[PosCore sharedInstance].userManager loginWithUsername:@"" password:@""];
    if(self.delegate&&[self.delegate respondsToSelector:@selector(loginSuccess)]){
        [self.delegate loginSuccess];
    }
}

#pragma mark - handle Notification

- (void)handleLoginNotification:(NSNotification*)notify
{
    NSDictionary* userInfor = [notify userInfo];
    if([[userInfor objectForKey:PosHttpErrorCode] integerValue] == 0){
        if(self.delegate&&[self.delegate respondsToSelector:@selector(loginSuccess)]){
            [self.delegate loginSuccess];
        }

    }else{
    
    }
}
@end

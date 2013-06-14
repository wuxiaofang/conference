//
//  PosLoginViewController.h
//  PosProject
//
//  Created by wu xiaofang on 13-6-7.
//  Copyright (c) 2013年 xiaofang.wu. All rights reserved.
//

#import "PosBaseViewController.h"

@protocol PosLoginDelegate <NSObject>
- (void)loginSuccess;
@end
@interface PosLoginViewController : PosBaseViewController
@property (nonatomic,assign)id<PosLoginDelegate>delegate;
@end

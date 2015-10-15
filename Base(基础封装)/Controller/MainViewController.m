//
//  MainViewController.m
//  BelApp
//
//  Created by Leon on 15/3/4.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"

@interface MainViewController ()

@property (nonatomic) NSUInteger lastIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = RGBColor(89, 119, 234);
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(showMessageCtrl) name:kChatNotification object:nil];
}

- (void)showMessageCtrl{
    self.selectedIndex = 0;
}

- (void)dealloc {
    LCLog(@"%@ -> dealloc", self);
    [[NSNotificationCenter  defaultCenter] removeObserver:self];
    
}

@end

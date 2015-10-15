//
//  BaseTableViewController.h
//  Yunzhijia
//
//  Created by Leon on 8/5/15.
//  Copyright (c) 2015 上海中资联财富投资管理有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface BaseTableViewController : UITableViewController <MJRefreshBaseViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) UIButton *loadMoreButton;

@property (nonatomic) NSInteger pageNo;
@property (nonatomic) NSInteger pageSize;

@property (nonatomic, weak) MJRefreshFooterView *footer;
@property (nonatomic, weak) MJRefreshHeaderView *header;

- (void)loadNewData;
- (void)loadMoreData;

@end

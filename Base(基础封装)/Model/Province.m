//
//  Province.m
//  CrmApp
//
//  Created by Leon on 15/5/8.
//  Copyright (c) 2015年 上海中资联财富投资管理有限公司. All rights reserved.
//

#import "Province.h"

@implementation Province

- (NSString *)formDisplayText{
    return _provName;
}

- (id)formValue{
    return _provCode;
}

@end

//
//  City.m
//  CrmApp
//
//  Created by Leon on 15/5/8.
//  Copyright (c) 2015年 上海中资联财富投资管理有限公司. All rights reserved.
//

#import "City.h"

@implementation City

- (NSString *)formDisplayText{
    return _cityName;
}

- (id)formValue{
    return _cityCode;
}

@end



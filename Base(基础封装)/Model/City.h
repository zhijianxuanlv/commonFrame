//
//  City.h
//  CrmApp
//
//  Created by Leon on 15/5/8.
//  Copyright (c) 2015年 上海中资联财富投资管理有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLForm.h"

@interface City : NSObject <XLFormOptionObject>

@property (nonatomic, strong) NSString *cityCode;
@property (nonatomic, strong) NSString *cityName;

@end

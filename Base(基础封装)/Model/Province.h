//
//  Province.h
//  CrmApp
//
//  Created by Leon on 15/5/8.
//  Copyright (c) 2015年 上海中资联财富投资管理有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLForm.h"

@interface Province : NSObject <XLFormOptionObject>

@property (nonatomic, strong) NSString *provId;
@property (nonatomic, strong) NSString *provCode;
@property (nonatomic, strong) NSString *provName;

@end

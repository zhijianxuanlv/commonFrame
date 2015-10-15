//
//  LCHttpRequest.m
//  MyTools
//
//  Created by Leon on 11/25/14.
//  Copyright (c) 2014 Leon. All rights reserved.
//

#import "HttpRequest.H"
#import "AFNetworking.h"
//#import "SignatureUtil.h"



@implementation HttpRequest

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    // 2.发送请求
    [mgr POST:[self getUrl:url] parameters:[self addSignWithParam:params]
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          if (success) {
#ifdef DEBUG
              [self printObject:responseObject];       
#endif
              success(responseObject);
          }
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          if (failure) {
              failure(error);
          }
      }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    
    
    // 2.发送请求
    [mgr POST:[self getUrl:url] parameters:[self addSignWithParam:params ] constructingBodyWithBlock:^(id<AFMultipartFormData> totalFormData) {
        for (OMFormData *formData in formDataArray) {
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
#ifdef DEBUG
            [self printObject:responseObject];
#endif
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [mgr GET:[self getUrl:url] parameters:[self addSignWithParam:params ]
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
#ifdef DEBUG
             [self printObject:responseObject];
#endif
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

+ (void)printObject:(NSDictionary *)responseObject{
    if ([NSJSONSerialization isValidJSONObject:responseObject]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"response --> %@",json);
    }
}


+ (NSDictionary *) addSignWithParam :(NSDictionary *)param{
    NSMutableDictionary *newParam = [[NSMutableDictionary alloc] initWithDictionary:param];
    //    [newParam setValue:[SignatureUtil signature] forKey:@"signature"];
    return newParam;
}
//
+ (NSString *)getUrl:(NSString *)url {
    if ([url hasPrefix:@"http"]) {
        return url;
    }
    return [NSString stringWithFormat:@"%@%@",BASE_URL,url];
}

@end

/**
 *  用来封装文件数据的模型
 */
@implementation OMFormData

@end

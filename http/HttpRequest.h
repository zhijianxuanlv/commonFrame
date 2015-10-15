//
//  LCHttpRequest.h
//  MyTools
//
//  Created by Leon on 11/25/14.
//  Copyright (c) 2014 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

//服务器地址 正式版
//#define BASE_URL @"http://221.224.170.100:9655/app/"
//#define IconUrl(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://221.224.170.100:9655/app/sys/emp/getimage.html?username=%@",(username)]]
//#define IconBgImage(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://221.224.170.100:9655/app/sys/theme/getcoverimage.html?username=%@",(username)]]
//#define IconUrlImage(filepath) [NSURL URLWithString:[[NSString stringWithFormat:@"http://221.224.170.100:9655/app/sys/theme/getimage.html?filepath=%@",(filepath)]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]

//服务器地址 39
//#define BASE_URL @"http://116.228.34.130:9655/app/"
//#define IconUrl(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://116.228.34.130:9655/app/sys/emp/getimage.html?username=%@",(username)]]
//#define IconBgImage(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://116.228.34.130:9655/app/sys/theme/getcoverimage.html?username=%@",(username)]]
//#define IconUrlImage(filepath) [NSURL URLWithString:[[NSString stringWithFormat:@"http://116.228.34.130:9655/app/sys/theme/getimage.html?filepath=%@",(filepath)]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]

#define BASE_URL @"http://192.168.23.49:8080/app/"
#define IconUrl(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.23.49:8080/app/sys/emp/getimage.html?username=%@",(username)]]
#define IconBgImage(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.23.49:8080/app/sys/theme/getcoverimage.html?username=%@",(username)]]
#define IconUrlImage(filepath) [NSURL URLWithString:[[NSString stringWithFormat:@"http://192.168.23.49:8080/app/sys/theme/getimage.html?filepath=%@",(filepath)]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]


//服务器地址 192
//#define BASE_URL @"http://192.168.23.192/app/"
//#define IconUrl(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.23.192/app/sys/emp/getimage.html?username=%@",(username)]]
//#define IconBgImage(username) [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.23.192/app/sys/theme/getcoverimage.html?username=%@",(username)]]
//#define IconUrlImage(filepath) [NSURL URLWithString:[[NSString stringWithFormat:@"http://192.168.23.192/app/sys/theme/getimage.html?filepath=%@",(filepath)]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]


@interface HttpRequest : NSObject

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formData  文件参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end


/**
 *  用来封装文件数据的模型
 */
@interface OMFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;


@end
